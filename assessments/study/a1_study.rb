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
  ciphed_str = ""

  str.chars.each do |letter|
    letter = ciphe(letter, shift) if letter.match(/[a-z]/i)
    ciphed_str << letter
  end

  ciphed_str
end

def ciphe(letter, shift)
  alphabet = ('a'..'z').to_a
  new_idx = alphabet.find_index(letter) + shift
  new_idx -= alphabet.count if new_idx > alphabet.count-1
  alphabet[new_idx]
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
  alphabet ||= ('a'..'z').to_a
  sorted = []

  alphabet.each do |char|
    sorted << str.scan(/#{char}/i)
  end

  sorted.join('')
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
    zero_sum_idxs = []

    0.upto(self.length-2).each do |i|
      i.upto(self.length-1).each do |i2|
        n1, n2 = self[i], self[i2]
        zero_sum_idxs << [i, i2] if n1 + n2 == 0
      end
    end

    zero_sum_idxs
  end
end

# a = [5,2,10,-5,-2]
# p a.two_sum

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    real_words = []

    self.split.each do |subword|
      real_words << subword if dictionary.include?(subword)
    end

    real_words
  end
end

# s = 'hello jklaslk;djf'
# p s.real_words_in_string(['hello', ','])

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  facs = []

  1.upto(num).each do |factor|
    facs << factor if num % factor == 0
  end

  facs
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

  def my_each(&prc)
    self.count.times do |i|
      prc.call self[i]
    end
  end

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

  def my_select(&prc)
    selected = []

    self.my_each do |el|
      selected << el if prc.call el
    end

    selected
  end

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

  def my_reject(&prc)
    non_rejected = []

    self.my_each do |el|
      non_rejected << el unless prc.call el
    end

    non_rejected
  end

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

  def my_any?(&prc)
    self.my_each do |el|
      return true if prc.call el
    end
    false
  end

  def my_all?(&prc)
    self.my_each do |el|
      return false unless prc.call el
    end
    true
  end

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

  def my_flatten
    flattened = []


    self.each do |el|
      if el.is_a?(Array)
        flattened += el.my_flatten
      else
        flattened += [el]
      end
    end

    flattened
  end

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

  def my_zip(*args)
    zipped = []

    self.each_with_index do |el, i|
      zip = [el]

      args.each do |arg|
        zip << arg[i]
      end

      zipped << zip
    end

    zipped
  end

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

  def my_rotate(rotator = 1)
    rotated = self.dup

    if rotator >= 0
      rotator.times do
        to_rotate = rotated.shift
        rotated << to_rotate
      end
    else
      rotator.abs.times do
        to_rotate = rotated.pop
        rotated.unshift(to_rotate)
      end
    end

    rotated
  end

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

  def my_join(splitter = ' ')
    joined = ""

    self.each.with_index do |el, i|
      joined << el
      joined << splitter unless i == self.length-1
    end

    joined
  end

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
    return self if self.length == 1
    self[1..-1].my_reverse + [self[0]]
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
  return [] if last < first
  return [first] if last == first
  [first] + range(first+1, last)
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

def exp1(n, exp)
  return 1 if exp == 0
  n * exp1(n, exp - 1)
end

def exp2(n, exp)
  return 1 if exp == 0

  if exp.even?
    exp2(n, exp / 2) ** 2
  else
    n * (exp2(n, (exp - 1) / 2) ** 2)
  end

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
  return [] if n <= 0
  return [1] if n == 1
  fib_arr = fibonacci(n - 1)
  fib_arr << fib_arr.last(2).reduce(:+)
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
  return nil if array.count <= 1 && array[0] != target

  mid_idx = (array.count / 2)
  mid_idx -= 1 if array.count.even?

  left = array[0..mid_idx]
  right = array[mid_idx+1..-1]

  mid_el = array[mid_idx]

  case target <=> mid_el
  when -1
    bsearch(left, target)
  when 0
    return mid_idx
  when 1
    right_side = bsearch(right, target)
    return nil if right_side.nil?
    left.count + right_side
  end

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
  return array if array.length == 1

  mid_idx = array.count / 2
  mid_idx -= 1 if array.count.even?
  left = array[0..mid_idx]
  right = array[mid_idx+1..-1]

  merge_helper(merge_sort(left), merge_sort(right), &prc)
end

def merge_helper(left, right, &prc)
  prc ||= Proc.new { |a,b| a <=> b }

  sorted = []

  until left.count == 0 || right.count == 0
    first_left, first_right = left.first, right.first
    break if first_left.nil? || first_right.nil?

    case prc.call(first_left, first_right)
    when -1
      sorted << first_left
      left.shift
    when 0
      sorted << first_left
      left.shift
    when 1
      sorted << first_right
      right.shift
    end
  end

  sorted + left + right
end

# a = [5,2,6,4,1,3]
# p merge_sort(a) { |a, b| a <=> b }


# Array Subsets
#
# Write a method subsets that will return all subsets of an array.
#

# You can implement this as an Array method if you prefer.
#
# Hint: For subsets([1, 2, 3]), there are two kinds of subsets:
#
# Those that do not contain 3 (all of these are subsets of [1, 2]).
# For every subset that does not contain 3, there is also a corresponding
# subset that is the same, except it also does contain 3.

def subsets(array)
  return [[]] if array.empty?
  last = array.pop

  full_subset = subsets(array)
  new_subset = []

  full_subset.each do |sub_arr|
    dup_sub_arr = sub_arr.deep_dup
    new_subset << sub_arr
    dup_sub_arr << last
    new_subset << dup_sub_arr
  end

  new_subset #+ full_subset
end
# p subsets([]) # => [[]]
# p subsets([1]) # => [[], [1]]
# p subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

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

def greedy_make_change(target, coins)
  change = []

  coins.each do |coin|
    until coin > target
      target -= coin
      change << coin
    end
  end

  change
end

# p greedy_make_change(24, [10,7,1])


# Consider the case of greedy_make_change(24, [10,7,1]). Because it takes
# as many 10 pieces as possible, greedy_make_change misses the correct
# answer of [10,7,7] (try it in pry).
#
# To make_better_change, we only take one coin at a time and never rule
# out denominations that we've already used. This allows each coin to be
# available each time we get a new remainder. By iterating over the
# denominations and continuing to search for the best change, we assure
# that we test for 'non-greedy' uses of each denomination.

def make_better_change(target, coins)
  best_change = nil
  current_change = []

  coins.sort.reverse

  coins.each do |coin|
    next if coin > target
    target -= coin
    current_change << coin
    make_better_change(target, coins)
    if best_change == nil || best_change.count > current_change.count
      best_change = current_change
    end
  end

  best_change
end

# p make_better_change(24, [10,7,1])

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
  return 0 if array.length <= 0
  return array[0] if array.length == 1
  array[0] + sum_recur(array[1..-1])
end

# a = [1,2,3,4,5]
# p sum_recur(a)

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return false if array.count == 1 && target != array[0]
  return true if array.shift == target
  includes?(array, target)
end

# a = [1,2,3,4,5]
# p includes?(a, 4)

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 0 if array.count == 0
  occurrences = 0
  occurrences += 1 if array.shift == target
  occurrences += num_occur(array, target)
end

# a = [1,2,4,2,3,5,2]
# p num_occur(a, 2)

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.count <= 1
  last_two_sum = array.last(2).reduce(:+)
  return true if last_two_sum == 12
  array.pop
  add_to_twelve?(array)
end

# a = [6,5,2,11]
# p add_to_twelve?(a)

# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array, &prc)
  return true if array.count <= 1

  prc ||= Proc.new { |a, b| a <=> b }

  first_two_el = array.first(2)
  first, sec = first_two_el

  return false if prc.call(first, sec) == 1
  array.shift
  sorted?(array, &prc)
end

# a = [1,2,3,6,4,5]
# p sorted?(a)

# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0...-1])
end

# # s = 'hello'
# p reverse(s)

#
# Exercise 1 - sum_to
#
# Write a function sum_to(n) that uses recursion to calculate the sum
# from 1 to n (inclusive of n).

def sum_to(n)
  return nil if n < 0
  return n if n == 0
  n += sum_to(n - 1)
end

  # Test Cases
# p  sum_to(5)  # => returns 15
# p  sum_to(1)  # => returns 1
# p  sum_to(9)  # => returns 45
# p  sum_to(-8)  # => returns nil





# Exercise 2 - add_numbers
#
# Write a function add_numbers(nums_array) that takes in an array of
# Fixnums and returns the sum of those numbers. Write this method recursively.

def add_numbers(nums_array = [])
  return nil if nums_array.count <= 0
  return nums_array[0] if nums_array.count == 1
  nums_array[0] + add_numbers(nums_array[1..-1])
end

#   # Test Cases
# p  add_numbers([1,2,3,4]) # => returns 10
# p  add_numbers([3]) # => returns 3
# p  add_numbers([-80,34,7]) # => returns -39
# p  add_numbers() # => returns nil



# Exercise 3 - Gamma Function
#
# Let's write a method that will solve Gamma Function recursively.
# The Gamma Function is defined Γ(n) = (n-1)!.

def gamma_fnc(n)
  return nil if n <= 0
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

#   # Test Cases
# p  gamma_fnc(0)  # => returns nil
# p  gamma_fnc(1)  # => returns 1
# p  gamma_fnc(4)  # => returns 6
# p  gamma_fnc(8)  # => returns 5040

#




class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    accumulator ||= self.shift

    self.each do |el|
      accumulator = prc.call(accumulator, el)
    end

    accumulator
  end

end

# a = [1,2,3,4,5]
# p a.my_inject { |a, b| a + b }

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num <= 1
  (2...num).each { |div| return false if num % div == 0 }
  true
end
#
# p is_prime?(1)
# p is_prime?(2)
# p is_prime?(21)
# p is_prime?(19)
# p is_prime?(20)

def primes(num)
  prime_arr = []
  return prime_arr if num <= 0
  n = 2

  until prime_arr.length == num
    prime_arr << n if is_prime?(n)
    n += 1
  end

  prime_arr
end

# p primes(5)

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

# 4 => [1,1,2,6]
# 3 * 2
# 2 *
def factorials_rec(num)
  return [] if num < 0
  return [1] if num == 1
  facs = factorials_rec(num - 1)
  next_fac = num * facs.last
  facs << next_fac
end

# p factorials_rec(4)

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.


  def dups
    dups_hash = {}

    dup_els = []
    self.each_with_index do |el, i|
      if self.count(el) > 1
        if dups_hash[el]
          dups_hash[el] << i
        else
          dups_hash[el] = [i]
        end
      end
    end

    dups_hash
  end
end

# p [1, 3, 4, 3, 0, 3, 0].dups# => { 3 => [1, 3, 5], 0 => [4, 6] }

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    palindromes = []

    (0..self.length-1).each do |i|
      (i..self.length-1).each do |j|
        substr = self[i..j]
        if substr === substr.reverse && substr.length > 1
          palindromes << substr unless palindromes.include?(substr)
        end
      end
    end

    palindromes
  end

end

# p 'cool'.symmetric_substrings

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if self.length <= 1

    mid_idx = self.count / 2
    mid_idx -= 1 if self.count.even?

    left = self[0..mid_idx]
    right = self[mid_idx+1..-1]

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private

  def self.merge(left, right, &prc)
    merged = []

    prc ||= Proc.new { |a, b| a <=> b }

    until left.length == 0 || right.length == 0
      first_left = left.first
      first_right = right.first
      break if first_left.nil? || first_right.nil?

      if prc.call(first_left, first_right) == 1
        merged << first_right
        right.shift
      else
        merged << first_left
        left.shift
      end
    end

    merged + left + right
  end

end

# a = [5,2,8,7,3,4,1,9,6]
# a = [3,1,2]
# p a.merge_sort
