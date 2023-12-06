#!/usr/bin/env ruby

class ShuntingYard
  PRECEDENCE = {
    '+' => 1,
    '-' => 1,
    '*' => 2,
    '/' => 2
  }.freeze

  def initialize(input)
    @input = input
    @output_queue = []
    @operator_stack = []
  end

  def to_rpn
    tokens = @input.gsub(/(\d+)/, ' \1 ').split

    tokens.each do |token|
      case token
      when /\d/
        @output_queue << token
      when '+', '-', '*', '/'
        while !@operator_stack.empty? && PRECEDENCE[@operator_stack.last] >= PRECEDENCE[token]
          @output_queue << @operator_stack.pop
        end
        @operator_stack.push(token)
      end
    end

    @output_queue += @operator_stack.reverse
    @output_queue.join(' ')
  end
end

def main
  input_expression = ARGV.join(' ')
  rpn_expression = ShuntingYard.new(input_expression).to_rpn
  puts rpn_expression
end

main if __FILE__ == $PROGRAM_NAME
