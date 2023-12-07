module Printable
  def print_info
    puts "Об'єкт класу #{self.class}, дані: #{self.inspect}"
  end
end

class User
  include Printable
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

user = User.new("Volodymyr", 19)
user.print_info

