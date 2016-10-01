require 'byebug'

# Recursion
# Estimated time: 5hrs
#
# Warmup
#
# Write a recursive method, range, that takes a start and an end and returns an
# array of all numbers between. If end < start, you can return the empty array.
# Write both a recursive and iterative version of sum of an array.

def range(start_number, last_number)
  return [] if last_number < start_number
  return [start_number] if start_number == last_number

  [start_number] + range(start_number+1, last_number)
end

# p range(1,5)

# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

def sum_to(n)
  return nil if n < 0
  return n if n == 0

  n += sum_to(n-1)
end

# Test Cases
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil


# Write a function add_numbers(nums_array) that takes in an array of Fixnums and
# returns the sum of those numbers. Write this method recursively.

def add_numbers(nums_array = nil)
  return nil if nums_array.nil?
  return nums_array[0] if nums_array.count <= 1

  nums_array[0] + add_numbers(nums_array[1..-1])
end

# Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers() # => returns nil




# Let's write a method that will solve Gamma Function recursively.
# The Gamma Function is defined Γ(n) = (n-1)!.

def gamma_fnc(n)
  return nil if n <= 0
  return n if n == 1

  (n-1) * gamma_fnc(n-1)
end

# Test Cases
# p gamma_fnc(0)# == nil # => returns nil
# p gamma_fnc(1)# == 1 # => returns 1
# p gamma_fnc(4)# == 6 # => returns 6
# p gamma_fnc(8)# == 5040 # => returns 5040


#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
  return nil if array.empty?
  return array[0] if array.count == 1

  array[0] + sum_recur(array[1..-1])
end

# p sum_recur([1,2,3,4,5])
# p sum_recur([0,1,2])

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return false if array.count <= 1 && target != array.count[0]
  return true if array.first == target
  includes?(array[1..-1], target)
end

a = [1,2,3,4,5,3,6,7,8,9]
# p includes?(a, 4)
# p includes?(a, 12)

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 0 if array.count == 0
  count = 0
  count += 1 if array[0] == target
  count + num_occur(array[1..-1], target)
end

# p num_occur(a, 4)

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.count <= 1
  first, sec = array[0..1]
  return true if first + sec == 12
  add_to_twelve?(array[1..-1])
end

# a = [1,4,6,5,6,12]
# p add_to_twelve?(a)

# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
  return true if array.count <= 1
  first, sec = array[0..1]
  return false if first > sec
  sorted?(array[1..-1])
end

# a = [1,5,2,4,3]
# b = [1,2,3,4,5]
# p sorted?(a)
# p sorted?(b)

# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0...-1])
end

# str = 'hello world'
# p reverse(str)




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

end

def exp_v2(b, n)

end

# p exp_v2(100, 22) #100
# p exp_v2(442,31) #64

# Suggestion: Break the methods down into parts.
#
# Suggestion 2: Try walking through your code with Simple Examples.
#
# If the n == 256, about how many nested recursive steps will we run in the first case?
#
# How deep will we need to recurse for the second? Keep in mind that the first r
# educes the exponent by one for each recursion, while the second reduces it by half.
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
    dup = []

    self.each do |el|
      if el.is_a?(Array)
        dup << el.deep_dup
      else
        dup << el
      end
    end

    dup
  end
end

# test_array = [1, [2], [3, [4]]]
# test_array_copy = test_array.deep_dup
# test_array_copy[1] << 5
#
# p test_array
# p test_array_copy



# Fibonacci
#
# Write a recursive and an iterative Fibonacci method. The method should
# take in an integer n and return the first n Fibonacci numbers in an array.
#
# You shouldn't have to pass any arrays between methods; you should be
# able to do this just passing a single argument for the number of Fibonacci numbers requested.
#

def fibonacci_r(n)
  return [] if n <= 0
  return [1] if n == 1
  fib_arr = fibonacci_r(n - 1)
  next_fib = fib_arr.last(2).reduce(:+)
  fib_arr << next_fib
end

# p fibonacci_r(5)
# p fibonacci_r(10)


# Binary Search
#
# The binary search algorithm begins by comparing the target value to
# the value of the middle element of the sorted array. If the target
# value is equal to the middle element's value, then the position is
# returned and the search is finished. If the target value is less than
# the middle element's value, then the search continues on the lower half
# of the array; or if the target value is greater than the middle
# element's value, then the search continues on the upper half of the
# array. This process continues, eliminating half of the elements, and
# comparing the target value to the value of the middle element of the
# remaining elements - until the target value is either found (and its
# associated element position is returned), or until the entire array has
# been searched (and "not found" is returned).
#
# Write a recursive binary search: bsearch(array, target). Note that
# binary search only works on sorted arrays. Make sure to return the
# location of the found object (or nil if not found!). Hint: you will
# probably want to use subarrays.
#
# This your first problem which is half a PITA to solve iteratively.
# Make sure that these test cases are working:

# [1,2,3], 3
# [1,2,3,4,5,6], 0
def bsearch(array, target)
  return nil if array.count <= 1 && target != array[0]
  # return array if array.count <= 1

  mid_idx = array.count / 2
  mid_idx -= 1 if array.count.even?

  left = array[0..mid_idx]
  right = array[mid_idx+1..-1]

  case array[mid_idx] <=> target
  when -1
    right_bsearch = bsearch(right, target)
    return nil if right_bsearch.nil?
    left.count + right_bsearch
  when 0
    return mid_idx
  when 1
    bsearch(left, target)
  end
end
#
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# Implement a method merge_sort that sorts an Array:

def merge_helper(array1, array2)
  merged = []

  until array1.count == 0 || array2.count == 0
    first_left = array1.first
    first_right = array2.first

    break if first_left.nil? || first_right.nil?

    if first_left < first_right
      merged << first_left
      array1.shift
    else
      merged << first_right
      array2.shift
    end

  end

  merged + array1 + array2
end

def merge_sort(array)
  return array if array.count <= 1

  mid_idx = array.count / 2
  mid_idx -= 1 if array.count.even?

  left_side = array[0..mid_idx]
  right_side = array[mid_idx+1..-1]

  merge_helper(merge_sort(left_side), merge_sort(right_side))
end

# p merge_helper([2,4,15,205,10259], [1,3,5])
# p merge_sort([3,1])


# Quick Sort
def my_quick_sort(array, &prc)
  return array if array.count <= 1

  prc ||= Proc.new { |a, b| a <=> b }

  rand_idx = rand(array.count-1)
  pivot = array[rand_idx]

  less_than_pivot = []
  eql_to_pivot = []
  greater_than_pivot = []

  array.each do |el|
    case prc.call(el, pivot)
    when -1
      less_than_pivot << el
    when 0
      eql_to_pivot << el
    when 1
      greater_than_pivot << el
    end
  end

  less_than_sorted = my_quick_sort(less_than_pivot, &prc)
  greater_than_sorted = my_quick_sort(greater_than_pivot, &prc)

  less_than_sorted + eql_to_pivot + greater_than_sorted
end

a = [5,2,1,3,7,8,4,9,0,6]
# p my_quick_sort(a)

# Bubble Sort
def bubble_sort(array, &prc)
  prc ||= Proc.new { |a, b| a <=> b }

  is_sorted = false
  until is_sorted
    is_sorted = true

    array.count.times do |i|
      el1, el2 = array[i], array[i+1]
      break if i == array.count-1
      if el1 > el2
        is_sorted = false
        array[i], array[i+1] = array[i+1], array[i]
      end

    end

  end

  array
end

# p bubble_sort(a)

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
  return [[]] if array.count <= 0
  last_el = array.pop
  subs = subsets(array)
  subs.concat(subs.map { |el| el += [last_el] })
end

# p subsets([]) == [[]]
# p subsets([1]) == [[], [1]]
# p subsets([1, 2])  == [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) == [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]



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

def greedy_make_change(target, coins)
  return [] if target <= 0 || coins.empty?

  change = []

  biggest_coin = coins.shift
  if biggest_coin <= target
    until target < biggest_coin
      change << biggest_coin
      target -= biggest_coin
    end
  end

  change + greedy_make_change(target, coins)
end

p greedy_make_change(24, [10, 7, 1])

# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes
# as many 10 pieces as possible, greedy_make_change misses the correct
# answer of [10,7,7] (try it in pry).

def make_better_change(target, coins)
  return [] if target <= 0
  return nil if coins.all? { |coin| coin > target }

  best_change = nil

  coins.each do |coin|
    next if target < coin
    remainder = target - coin
    new_change = [coin]

    change_remainder = make_better_change(remainder, coins)
    next if change_remainder.nil?
    new_change += change_remainder

    if best_change.nil? || best_change.count > new_change.count
      best_change = new_change
    end

  end

  best_change
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
