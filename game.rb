#!/usr/bin/env ruby

CHOICES = ['Stone', 'Paper', 'Scissors']

def determine_winner(user_choice, computer_choice)
  return 'Draw' if user_choice == computer_choice

  case user_choice
  when 'Stone'
    computer_choice == 'Scissors' ? 'You win' : 'You lose'
  when 'Paper'
    computer_choice == 'Stone' ? 'You win' : 'You lose'
  when 'Scissors'
    computer_choice == 'Paper' ? 'You win' : 'You lose'
  else
    'Invalid choice'
  end
end

def main
  user_choice = ARGV[0]
  computer_choice = CHOICES.sample

  unless CHOICES.include?(user_choice)
    puts 'Invalid choice. Please select Stone, Paper, or Scissors.'
    return
  end

  puts "Your choice: #{user_choice}"
  puts "Computer's choice: #{computer_choice}"
  puts determine_winner(user_choice, computer_choice)
end

main if __FILE__ == $PROGRAM_NAME
