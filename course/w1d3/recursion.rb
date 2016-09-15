# Recursion
# Estimated time: 5hrs
#
# Warmup
#
# Write a recursive method, range, that takes a start and an end and returns an array of all numbers between. If end < start, you can return the empty array.
# Write both a recursive and iterative version of sum of an array.

def range(start_number, last_number)
  result = [start_number]
  return result if start_number == last_number
  result += range(start_number + 1, last_number)
end

# p range(1,5)


# Exponentiation
#
# Write two versions of exponent that use two different recursions:

# this is math, not Ruby methods.

# recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)
#
# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2).
#Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself.
#So don't cheat and use exponentiation in your solution.

def exp_v1(b,n)
  return 1 if n == 0
  b * exp_v1(b, n - 1)
end

def exp_v2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    value = exp_v2(b, n / 2)
    value * value
  else
    value = exp_v2(b, (n - 1) / 2)
    b * value * value
  end
end

# p exp_v2(100, 22) #100
# p exp_v2(442,31) #64

# Suggestion: Break the methods down into parts.
#
# Suggestion 2: Try walking through your code with Simple Examples.
#
# If the n == 256, about how many nested recursive steps will we run in the first case?
#
# How deep will we need to recurse for the second? Keep in mind that the first reduces the exponent by one for each recursion, while the second reduces it by half.
#
# In addition to testing your methods by running the code, try the following exercise:
#
# On paper, write out the value of each variable for every line in the code:
#
# Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to the very end in these examples.
#
# How many examples do you need to walk through to be confident that it works?
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

class Array
  def deep_dup
    result = []
    self.each do |el|
      if el.is_a?(Array)
        result << el.deep_dup
      else
        result << el
      end
    end
    result
  end
end

test_array = [1, [2], [3, [4]]]
test_array_copy = test_array.dup
test_array_copy[1] << 5

# p test_array
# p test_array_copy


# When we dup an Array, it creates a new array to hold the elements, but
# doesn't recursively dup any arrays contained therein. So the dup method
# creates one new array, but just copies over references to the original interior arrays.
#
# Sometimes you want a shallow dup and sometimes you want a deep dup.
# Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.
#
# Using recursion and the is_a? method, write an Array#deep_dup method
# that will perform a "deep" duplication of the interior arrays.
#
# Note: For simplicity's sake, we are only going to ensure the deep
# duplication of arrays. Don't worry about deep-duping (or regular-duping)
# other types of mutable objects (like strings, hashes, instances of custom
# classes, etc.), since this would require that we implement a deep dup method for each of those classes, as well.
#
# It's okay to iterate over array elements using the normal each for this one :-)
#
# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].
#



# Fibonacci
#
# Write a recursive and an iterative Fibonacci method. The method should
# take in an integer n and return the first n Fibonacci numbers in an array.
#
# You shouldn't have to pass any arrays between methods; you should be
# able to do this just passing a single argument for the number of Fibonacci numbers requested.
#

def fibonacci_r(num_req)
  return nil if num_req < 0
  return [0] if num_req <= 1
  return [0,1] if num_req == 2

  fib_arr = fibonacci_r(num_req - 1)
  fib_arr << fib_arr.last(2).reduce(:+)
end

def fibbonacci_i(num_req)

end


# p fibonacci_r(10)


# Binary Search
#
# The binary search algorithm begins by comparing the target value to the value of
# the middle element of the sorted array. If the target value is equal to the middle element's value,
# then the position is returned and the search is finished. If the target value is less
# than the middle element's value, then the search continues on the lower half of the array;
#  or if the target value is greater than the middle element's value, then the search continues
#  on the upper half of the array. This process continues, eliminating half of the elements,
#  and comparing the target value to the value of the middle element of the remaining elements -
#  until the target value is either found (and its associated element position is returned),
#    or until the entire array has been searched (and "not found" is returned).
#
# Write a recursive binary search: bsearch(array, target). Note that binary search only
# works on sorted arrays. Make sure to return the location of the found object (or nil if
# not found!). Hint: you will probably want to use subarrays.
#
# This your first problem which is half a PITA to solve iteratively.
#
# Make sure that these test cases are working:
#
require 'byebug'
def bsearch(array, target)
  middle_index = array.length.odd? ? (array.length / 2) : (array.length / 2) - 1
  return middle_index if target == array[middle_index]
  return nil if array.length == 1 && target != array[middle_index]

  array.sort!

  if target > array[middle_index]
    middle_index = 1 if array.length == 2
    if bsearch(array[middle_index..-1], target).nil?
      return nil
    else
      middle_index + bsearch(array[middle_index..-1], target)
    end
  else
    bsearch(array[0..middle_index], target)
  end

end
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# #


# Merge Sort
#
# Implement a method merge_sort that sorts an Array:
#
# The base cases are for arrays of length zero or one. Do not use a length-two array as a base case.
# This is unnecessary.
# You'll want to write a merge helper method to merge the sorted halves.
# To get a visual idea of how merge sort works, watch this gif and check out this diagram.

def merge_helper(array, array2)
  sorted = []
  while array2.length > 0
    el1 = array.first
    el2 = array2.first
    if (el1 <=> el2) == -1
      sorted << el1
      array.shift
    else
      sorted << el2
      array2.shift
    end
  end
  sorted + array
end

def merge_sort(array)
  final_result = []
  return array if array.length == 1

  middle_index = array.length / 2
  first_half = array[0..middle_index - 1]
  second_half = array[middle_index..-1]

  final_result += merge_helper(merge_sort(first_half), merge_sort(second_half))
end

# p merge_helper([1,2,3,7,8], [9,10])
p merge_sort([10,2,3,7,8,9,1])
p merge_sort([38,27])

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
# For every subset that does not contain 3, there is also a corresponding subset that is the same,
# except it also does contain 3.

def subsets(array)
  return [[]] if array.length <= 0
    last_item = array.pop
    sub_recursion = subsets(array)
    with_shovel = sub_recursion.deep_dup
    with_shovel.each do |el|
      el << last_item
    end
    sub_recursion + with_shovel
end

# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]



# Make Change
#
# RubyQuiz: Make change.
#
# Here's a game plan for solving the problem:
# First, write a 'greedy' version called greedy_make_change:
# Take as many of the biggest coin as possible and add them to your result.
# Add to the result by recursively calling your method on the remaining amount,
# leaving out the biggest coin, until the remainder is zero.
# Once you have a working greedy version, talk with your partner about
# refactoring this to make_better_change. What's wrong with greedy_make_change?
#

# def greedy_make_change(target, coin_values)
#   result = []
#   return result if target == 0
#   coin_values.each do |coin|
#     if <= target
#       result << coin
#
#   end
#
# end

def greedy_make_change(target, coins)
  result = []
  return result if target == 0
  largest_coin = coins.shift
  while target >= largest_coin
    result << largest_coin
    target -= largest_coin
  end

  result + greedy_make_change(target, coins)
end

# p greedy_make_change(24, [10, 7, 1])

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes
# as many 10 pieces as possible, greedy_make_change misses the correct
# answer of [10,7,7] (try it in pry).
#
def make_better_change(target, coins)
  return [] if target <= 0
  return nil if coins.none? { |coin| coin < target }
  best_result = nil
  coins.each do |coin|
    if target >= coin
      remainder = target - coin
      current_result = [coin]
      best_change_remainder = make_better_change(remainder, coins)
      next if best_change_remainder.nil?
      current_result += best_change_remainder
      best_result = current_result if (best_result.nil? ||
      current_result.length < best_result.length)
    end
  end
  best_result
end

p make_better_change(24, [10, 7, 1])

# To make_better_change, we only take one coin at a time and never rule
# out denominations that we've already used. This allows each coin to be
# available each time we get a new remainder. By iterating over the denominations
# and continuing to search for the best change, we assure that we test for
# 'non-greedy' uses of each denomination.
#
# Discuss the following game plan and then work together to implement your new method:
#
# Iterate over each coin.
# Grab only one of that one coin and recursively call make_better_change
#  on the remainder using all of the same coins.
# Add the change for the remainder to the single coin you originally grabbed
# to obtain a possible solution.
# Keep track of the best solution and return it at the end.
# N.B. Don't generate every possible permutation of coins and then compare them.
#
# Make sure you and your partner understand each line before moving on.
#
# Resources
#
# Wikipedia: Recursion
