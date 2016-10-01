# Rule 1: If a word begins with a vowel sound, add an "ay" sound to
# the end of the word.
#
# Rule 2: If a word begins with a consonant sound, move it to the end
# of the word, and then add an "ay" sound to the end of the word.
#
# (There are a few more rules for edge cases, and there are regional
# variants too, but that should be enough to understand the tests.)
#
# See <http://en.wikipedia.org/wiki/Pig_latin> for more details.


# check if word starts with vowel
# if vowel_start, add 'ay'
# if !vowel_start, move first to back and recheck vowel_start and move first to last until vowel_start

def vowel_start(word)
    vowels = 'a', 'e', 'i', 'o', 'u'
    vowels.any? { |vowel| vowel == word[0] }
end

def first_to_last(word)
    return word if vowel_start(word)
    word[0..1] == 'qu' ? first = word.chars.shift(2).join('') : first = word.chars.shift
    word = word[first.length..-1] + first
    first_to_last(word)
end

def add_ay(word)
    "#{word}ay"
end

def translate(string)
    pig_latin = []
    string.split.each do |word|
        pig_latin << add_ay(first_to_last(word))
    end
    pig_latin.join(' ')
end
