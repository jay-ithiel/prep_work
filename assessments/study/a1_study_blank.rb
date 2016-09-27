require 'byebug'

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".
#
# Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)

end



# p ciphe('a', 1)
# p caesar_cipher('abc zab', 1)
# p caesar_cipher('zab', 1)

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)

end

def digital_root_step(num)

end



# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

def jumble_sort(str, alphabet = nil)

end

# Example:
# p jumble_sort("hello")# => "ehllo"
# p jumble_sort("hello" , ['o', 'l', 'h', 'e'])# => 'ollhe'

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum

  end
end

# a = [5,2,10,-5,-2]
# p a.two_sum

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)

  end
end

# s = 'hello jklaslk;djf'
# p s.real_words_in_string(['hello', ','])

# Write a method that returns the factors of a number in ascending order.

def factors(num)

end

# p factors(20)


# Iteration Exercises
#
# Enumerable
#
# My Each
#
# Extend the Array class to include a method named my_each that takes a
# block, calls the block on every element of the array, and then returns
# the original array. Do not use Enumerable's each method. I want to be
# able to write:

class Array



end

# a = [1,2,3]
# a.my_each { |n| puts n }


# My Select
#
# Now extend the Array class to include my_select that takes a block and
# returns a new array containing only elements that satisfy the block.
# Use your my_each method!
#


class Array



end

# Example:
#
# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []



# My Reject
#
# Write my_reject to takes a block and return a new array excluding
# elements that satisfy the block.
#

class Array


end

# Example:
#
# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]


# My Any
#
# Write my_any? to return true if any elements of the array satisfy the
# block and my_all? to return true only if all elements satisfy the block.

class Array


end

# Example:

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


# My Flatten
#
# my_flatten should return all elements of the array into a new,
# one-dimensional array. Hint: use recursion!

class Array


end
# Example:
#
# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]


# My Zip
#
# Write my_zip to take any number of arguments. It should return a new
# array containing self.length elements. Each element of the new array
# should be an array with a length of the input arguments + 1 and contain
# the merged elements at that index. If the size of any argument is less
# than self, nil is returned for that location.

class Array



end

# Example:
#
# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
#
# p a.my_zip([1,2], [8])   == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    == [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)     == [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# My Rotate
#
# Write a method my_rotate that returns self rotated. By default, the
# array should rotate by one element. If a negative value is given, the
# array is rotated in the opposite direction.

class Array



end


# Example:
#
# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         == ["b", "c", "d", "a"]
# p a.my_rotate(2)      == ["c", "d", "a", "b"]
# p a.my_rotate(-3)     == ["b", "c", "d", "a"]
# p a.my_rotate(15)     == ["d", "a", "b", "c"]


# My Join
#
# my_join returns a single string containing all the elements of the
# array, separated by the given string separator. If no separator is
# given, an empty string is used.

class Array



end

# Example:
#
# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"


# My Reverse
#
# Write a method that returns a new array containing all the elements of
# the original array in reverse order.

class Array

  def my_reverse
  end

end

# Example:
#
# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]




#
# Recursion
#
# Estimated time: 5hrs
#
# Warmup
#
# Write a recursive method, range, that takes a start and an end and
# returns an array of all numbers between. If end < start, you can return
# the empty array.

def range(first, last)
end


# p range(1,5)



# Exponentiation
#
# Write two versions of exponent that use two different recursions:
#
# # this is math, not Ruby methods.
#
# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)
#
# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of
# exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need
# to do anything special to square a number, just calculate the value
# and multiply it by itself. So don't cheat and use exponentiation in
# your solution.

  end

# p exp1(9, 3)
# p exp2(9, 3)


#
# Deep dup
#
# The #dup method doesn't make a deep copy:
#
# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]
#
# robot_parts_copy = robot_parts.dup
#
# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # wtf?
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When we dup an Array, it creates a new array to hold the elements, but
# doesn't recursively dup any arrays contained therein. So the dup method
# creates one new array, but just copies over references to the original
# interior arrays.
#
# Sometimes you want a shallow dup and sometimes you want a deep dup.
# Ruby keeps things simple by giving you shallow dup, and letting you
# write deep dup yourself.
#
# Using recursion and the is_a? method, write an Array#deep_dup method
# that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, we are only going to ensure the deep
# duplication of arrays. Don't worry about deep-duping (or regular-duping)
# other types of mutable objects (like strings, hashes, instances of
# custom classes, etc.), since this would require that we implement a
# deep dup method for each of those classes, as well.
#
# It's okay to iterate over array elements using the normal each for this one :-)
#
# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

class Array

  def deep_dup
  end
  end

end

# a = [1, [2], [3, [4]]]
# # a = [[], []]
# b = a.deep_dup
# b[1] << 'hello'
# p a
# p b



# Fibonacci
#
# Write a recursive and an iterative Fibonacci method. The method should
# take in an integer n and return the first n Fibonacci numbers in an array.
#
# You shouldn't have to pass any arrays between methods; you should be
# able to do this just passing a single argument for the number of
# Fibonacci numbers requested.

def fibonacci(n)
end
end

# p fibonacci(8)




# Binary Search
#
# The binary search algorithm begins by comparing the target value to the
# value of the middle element of the sorted array. If the target value is
# equal to the middle element's value, then the position is returned and
# the search is finished. If the target value is less than the middle
# element's value, then the search continues on the lower half of the
# array; or if the target value is greater than the middle element's value,
# then the search continues on the upper half of the array. This process
# continues, eliminating half of the elements, and comparing the target
# value to the value of the middle element of the remaining elements -
# until the target value is either found (and its associated element
# position is returned), or until the entire array has been searched
# (and "not found" is returned).
#
# Write a recursive binary search: bsearch(array, target). Note that
# binary search only works on sorted arrays. Make sure to return the
# location of the found object (or nil if not found!). Hint: you will
# probably want to use subarrays.
#
# This your first problem which is half a PITA to solve iteratively.

def bsearch(array, target)
end

# Make sure that these test cases are working:
#
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil




# Merge Sort
#
# Implement a method merge_sort that sorts an Array:
#
# The base cases are for arrays of length zero or one. Do not use a
# length-two array as a base case. This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.

def merge_sort(array, &prc)
  return [] if array.length == 0
end
end

def merge_helper(left, right, &prc)
end
end

# a = [5,2,6,4,1,3]
# p merge_sort(a) { |a, b| a <=> b }


# Array Subsets
#
# Write a method subsets that will return all subsets of an array.
#
# subsets([]) # => [[]]
# subsets([1]) # => [[], [1]]
# subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# subsets([1, 2, 3])
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]
# You can implement this as an Array method if you prefer.
#
# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:
#
# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding
# subset that is the same, except it also does contain 3.

def subsets(array)

end


# Make Change
#
# RubyQuiz: Make change.
#
# Here's a game plan for solving the problem:
#
# First, write a 'greedy' version called greedy_make_change:
#
# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining
# amount, leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about
# refactoring this to make_better_change. What's wrong with greedy_make_change?
#
# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes
# as many 10 pieces as possible, greedy_make_change misses the correct
# answer of [10,7,7] (try it in pry).
#
# To make_better_change, we only take one coin at a time and never rule
# out denominations that we've already used. This allows each coin to be
# available each time we get a new remainder. By iterating over the
# denominations and continuing to search for the best change, we assure
# that we test for 'non-greedy' uses of each denomination.

# Discuss the following game plan and then work together to implement your new method:
#
# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change on the remainder using all of the same coins.
# Add the change for the remainder to the single coin you originally grabbed to obtain a possible solution.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them.
#
# Make sure you and your partner understand each line before moving on.





#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
end

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
end

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
end

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
end

# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
end

# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
end
#
# Exercise 1 - sum_to
#
# Write a function sum_to(n) that uses recursion to calculate the sum
# from 1 to n (inclusive of n).
#
#   # Test Cases
#   sum_to(5)  # => returns 15
#   sum_to(1)  # => returns 1
#   sum_to(9)  # => returns 45
#   sum_to(-8)  # => returns nil



# Exercise 2 - add_numbers
#
# Write a function add_numbers(nums_array) that takes in an array of
# Fixnums and returns the sum of those numbers. Write this method recursively.
#
#   # Test Cases
#   add_numbers([1,2,3,4]) # => returns 10
#   add_numbers([3]) # => returns 3
#   add_numbers([-80,34,7]) # => returns -39
#   add_numbers() # => returns nil



# Exercise 3 - Gamma Function
#
# Let's write a method that will solve Gamma Function recursively.
# The Gamma Function is defined Γ(n) = (n-1)!.
#
#   # Test Cases
#   gamma_fnc(0)  # => returns nil
#   gamma_fnc(1)  # => returns 1
#   gamma_fnc(4)  # => returns 6
#   gamma_fnc(8)  # => returns 5040
#
#




class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
  end

end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
end

def primes(num)
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

# 4 => [1,1,2,6]
# 3 * 2
# 2 *
def factorials_rec(num)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
  end

  private

  def self.merge(left, right, &prc)
  end

end
