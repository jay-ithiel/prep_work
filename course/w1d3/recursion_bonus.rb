#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
  return array[0] if array.count == 1
  array[0] + sum_recur(array[1..-1])
end
# [5,3]
# p sum_recur([5,3,6,8])

#Problem 2: You have array of integers. Write a recursive solution to determine
#whether or not the array contains a specific value.

def includes?(array, target)
  return false if array.count == 0
  n = array.pop
  return true if n == target
  includes?(array, target)
end
# p includes?([1,2,3,4,5], 3)
# p includes?([1,2,3,4,5], 7)

# Problem 3: You have an unsorted array of integers. Write a recursive solution
# to count the number of occurrences of a specific value.

def num_occur(array, target)
  return 0 if array.count == 0
  count = 0

  n = array.pop

  count += 1 if n == target
  count + num_occur(array, target)
end

# p num_occur([1,2,2,3], 2)
# p num_occur([1,2,3,4,5], 6)

# Problem 4: You have array of integers. Write a recursive solution to determine
# whether or not two adjacent elements of the array add to 12.

def add_to_twelve?(array)
  return false if array.length <= 1
  last_two = array.last(2)
  return true if last_two.reduce(:+) == 12
  array.pop
  add_to_twelve?(array)
end

# p add_to_twelve?([3,3,3,3])

# Problem 5: You have array of integers. Write a recursive solution to determine
# if the array is sorted.

def sorted?(array)
  return true if array.length == 0
  last_two = array.last(2)
  return false unless last_two.sort == last_two
  # array.pop
  sorted?(array[0..-2])
end
#
p sorted?([1,2,3,4,5])
p sorted?([5,4,3,2,1])
# Problem 6: Write a recursive function to reverse a string. Don't use any
# built-in #reverse methods!

def reverse(string)
  return string if string.length == 1
  string[-1] + reverse(string[0..-2])
end
# he
p reverse("hello")
