def create_acronym(sentence)
  sentence.split.map { |word| word[0].upcase }.join
end

puts create_acronym("центральний обробник одиниць")

