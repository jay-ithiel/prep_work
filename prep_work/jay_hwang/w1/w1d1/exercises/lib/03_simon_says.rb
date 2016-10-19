# # Simon Says
#
# ## Topics
#
# * functions
# * strings
# * default parameter values
#
# ## Hints
#
# When you make the second `repeat` test pass, you might break the
# **first**

def echo(phrase)
  "#{phrase}"
end

def shout(phrase)
  "#{phrase.upcase}"
end

def repeat(phrase, repeat = 2)
  repeated = []
  repeat.times { repeated << phrase }
  repeated.join(' ')
end

def start_of_word(word, letters)
  word[0..letters-1]
end

def first_word(phrase)
  phrase.split[0]
end

def titleize(string)
    little_words = ['and', 'or', 'but', 'the', 'a', 'over']
    titleized = []
    string.split.each_with_index do |word, index|
        if !little_words.any? { |little_word| little_word == word } || index == 0
            titleized << word.capitalize
        else
            titleized << word
        end
    end
    titleized.join(' ')
end
