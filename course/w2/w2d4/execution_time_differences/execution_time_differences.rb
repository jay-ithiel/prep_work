# my_min
#
# Given a list of integers find the smallest number in the list.
#
# Example:
#
#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5
# Phase I
#
# First, write a function that compares each element to every other element of the list. Return the element if all other elements in the array are larger.
# What is the time complexity for this function?

def my_min(list)
  list.each do |elem|
    return elem if list.all? {|x| x >= elem}
  end
end

# n^2



# Phase II
#
# Now rewrite the function to iterate through the list just once while keeping track of the minimum. What is the time complexity?
#

def my_min2(list)
  minimum = nil

  list.each do |elem|
    minimum = elem if minimum == nil || minimum >= elem
  end

  minimum
end


# Largest Contiguous Sub-sum
#
# You have an array of integers and you want to find the largest contiguous (together in sequence) sub-sum. Find the sums of all contiguous sub-arrays and return the max.
#
# Example:
#
#     list = [5, 3, -7]
#     largest_contiguous_subsum(list) # => 8
#
#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7
# Example 2:
#
#     list = [2, 3, -6, 7, -6, 7]
#     largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
# Example 3:
#
#     list = [-5, -1, -3]
#     largest_contiguous_subsum(list) # => -1 (from [-1])
# Phase I
#
# Write a function that iterates through the array and finds all sub-arrays using nested loops. First make an array to hold all sub-arrays. Then find the sums of each sub-array and return the max.
#
# Discuss the time complexity of this solution.

def contiguous(array)
  res = []

  array.count.times do |i|
    i.upto(array.count-1).each do |j|
      res << array[i..j]
    end
  end

  largest_sum = nil
  res.each do |sub_arr|
    current_sum = sub_arr.inject(:+)
    largest_sum = current_sum if largest_sum == nil || largest_sum < current_sum
  end
  largest_sum
end


# Phase II
#
# Let's make a better version. Write a new function using O(n) time with O(1) memory.
# Keep a running tally of the largest sum.
#
# Get your story straight, and then explain your solution's time complexity to your TA.

def contiguous2(array)
  total_sum = nil
  current_num = nil

  array.each do |num|
    if current_num.nil? || num > current_num
      current_num = num
    end

    if total_sum.nil? || current_sum > total_sum
      total_sum = current_num
    end

    possible_sum = current_num + total_sum
    if possible_sum > total_sum
      total_sum = possible_sum
    end
  end

  total_sum

end

p contiguous2([2, 3, -6, 7, -6, 7])
p contiguous2([-5, -1, -3])
