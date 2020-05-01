# Given string, return a hash where key is letter and value = number of times it appears
# string = "abbc d"
# return {a; 1, b;2, c;1}

# iterate the string " bb d" using each_char
# count the number of times a letter appears
# check if letter exists using !(bang) on the return value of count[letter]
# if letter is an empty string, immediately go to the next iteration using "next".
# if letter doesn't exist, set value of count[letter] to 1.
# if letter exists, increment value of count[letter] by 1.
# return the letters and the number of times it appears

def letter_count(str)
  count = Hash.new(0) # sets value of hash beginning to 0

  str.each_char do |set| # iterate through "str", and for every character, -do-
    count[set] += 1 unless count[set] == " " # increment the (next) value of count[set] by 1 UNLESS count[set] is (TRUE) an empty string (" ")
  end
  count # returns the count hash
end
