def roman_to_int(roman)
  values = { 'M' => 1000, 'CM' => 900, 'D' => 500, 'CD' => 400,
             'C' => 100, 'XC' => 90, 'L' => 50, 'XL' => 40,
             'X' => 10, 'IX' => 9, 'V' => 5, 'IV' => 4,
             'I' => 1 }

  int = 0
  i = 0
  while i < roman.length
    if i + 1 < roman.length && values[roman[i..i+1]]
      int += values[roman[i..i+1]]
      i += 2
    else
      int += values[roman[i]]
      i += 1
    end
  end
  int
end

def int_to_roman(num)
  values = { 1000 => 'M', 900 => 'CM', 500 => 'D', 400 => 'CD',
             100 => 'C', 90 => 'XC', 50 => 'L', 40 => 'XL',
             10 => 'X', 9 => 'IX', 5 => 'V', 4 => 'IV', 1 => 'I' }

  roman = ''
  values.each do |value, letter|
    roman << letter * (num / value)
    num = num % value
  end
  roman
end

def valid_roman?(roman)
  roman.match?(/\A[MDCLXVI]+\z/)
end

def valid_integer?(num)
  num.between?(1, 3999)
end

def main
  puts "Виберіть опцію:"
  puts "1. Римське число в ціле"
  puts "2. Ціле число в римське"
  choice = gets.chomp

  case choice
  when "1"
    puts "Введіть римське число:"
    roman = gets.chomp
    if valid_roman?(roman)
      puts "Результат: #{roman_to_int(roman)}"
    else
      puts "Помилка: Неправильний формат римського числа"
    end
  when "2"
    puts "Введіть ціле число (1-3999):"
    number = gets.chomp.to_i
    if valid_integer?(number)
      puts "Результат: #{int_to_roman(number)}"
    else
      puts "Помилка: Число повинно бути в межах від 1 до 3999"
    end
  else
    puts "Невідома опція"
  end
end

main if __FILE__ == $PROGRAM_NAME
