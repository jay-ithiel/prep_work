def ordered_vowel_words(str)
  str.split.reject { |word| !ordered_vowels?(word) }.join(' ')
end

def ordered_vowels?(word)
  word_vowels = word.scan(/[aeiou]/i)
  word_vowels === word_vowels.sort
end
