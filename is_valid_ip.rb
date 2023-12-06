def valid_ipv4_address?(ip)
  parts = ip.split('.')

  return false unless parts.length == 4

  parts.all? do |part|
    part.match?(/\A(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/) && part == part.to_i.to_s
  end
end

# Метод для вводу IP-адреси користувачем
 def user_input_ipv4_validation
   puts "Введіть IPv4 адресу:"
   ip = gets.chomp
   puts "#{ip}: #{valid_ipv4_address?(ip)}"
 end

 user_input_ipv4_validation

## Приклади використання
#puts "192.168.1.1: #{valid_ipv4_address?("192.168.1.1")}"    # true
#puts "255.255.255.255: #{valid_ipv4_address?("255.255.255.255")}" # true
#puts "0.0.0.0: #{valid_ipv4_address?("0.0.0.0")}"         # true
#puts "192.168.1.256: #{valid_ipv4_address?("192.168.1.256")}"   # false
#puts "192.168.01.1: #{valid_ipv4_address?("192.168.01.1")}"    # false
#puts "192.168.1: #{valid_ipv4_address?("192.168.1")}"       # false
#puts "abc.def.ghi.jkl: #{valid_ipv4_address?("abc.def.ghi.jkl")}" # false
