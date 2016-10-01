require 'byebug'

# Anagrams
#
# Our goal today is to write a method that determines if two given words are anagrams. This means that the letters in one word can be rearranged to form the other word. For example:
#
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true
# Assume that there is no whitespace or punctuation in the given strings.
#
# Phase I:
#
# Write a method #first_anagram? that will generate and store all the possible anagrams of the first string. Check if the second string is one of these.


def anagram(word, target)
  anagrams = word.chars.permutation.to_a.map(&:join)

  anagrams.include?(target)
end

# Hints:
#
# For testing your method, start with small input strings, otherwise you might wait a while
# If you're having trouble generating the possible anagrams, look into this method.
# What is the time complexity of this solution? What happens if you increase the size of the strings?
#
# Phase II:
#
# Write a method #second_anagram? that iterates over both strings. As you find letters that appear in both words, delete them one at a time. They are anagrams if both the strings are empty at the end.
#
# Try varying the length of the input strings. What are the differences between #first_anagram? and #second_anagram??
#

def anagram2(word, target)
  word_array = word.chars
  target_array = target.chars

  word.length.times do
    letter = word_array.pop

    if target_array.include?(letter)
      target_array.delete(letter)
    else
      word_array.unshift(letter)
    end
  end

  word_array.empty? && target_array.empty?

end

# p anagram2("gizmo", "sally")    #=> false
# p anagram2("elvis", "lives")    #=> true



# Phase III:
#
# Write a method #third_anagram? that solves the problem by sorting both strings alphabetically. The strings are then anagrams if and only if the sorted versions are the identical.
#
# What is the time complexity of this solution? Is it better or worse than #second_anagram??
#

def anagram3(word, word2)
  word.chars.sort == word2.chars.sort
end


# Phase IV:
#
# Write one more method #fourth_anagram?. This time, use two Hashes to store the number of times each letter appears in both words. Compare the resulting hashes.
#
# What is the time complexity?
#
# Bonus: Do it with only one hash.
#
# Discuss the time complexity of your solutions together, then call over your TA to look at them.

def anagram4(word, word2)
  hash = Hash.new(0)
  hash2 = Hash.new(0)

  word.chars.each {|char| hash[char] += 1}
  word2.chars.each {|char| hash2[char] += 1}

  diff = hash.to_a - hash2.to_a
  diff.empty?
end

# p anagram4("gizmo", "sally")    #=> false
# p anagram4("elvis", "lives")    #=> true
