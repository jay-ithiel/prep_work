# Write a function sum_to(n) that uses recursion to calculate the sum from 1 to n (inclusive of n).

def sum_to(n)
  return nil if n <= 0
  return n if n == 1
  n += sum_to(n-1)
end

# Test Cases
# p sum_to(5)  # => returns 15
# p sum_to(1)  # => returns 1
# p sum_to(9)  # => returns 45
# p sum_to(-8)  # => returns nil


# Write a function add_numbers(nums_array) that takes in an array of Fixnums and returns the sum of those numbers. Write this method recursively.

def add_numbers(nums_array = nil)
  return nil if nums_array == nil
  return nums_array.first if nums_array.length <= 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

# Test Cases
# p add_numbers([1,2,3,4]) # => returns 10
# p add_numbers([3]) # => returns 3
# p add_numbers([-80,34,7]) # => returns -39
# p add_numbers() # => returns nil




# Let's write a method that will solve Gamma Function recursively. The Gamma Function is defined Γ(n) = (n-1)!.

def gamma_fnc(n)
  return nil if n == 0
  return n if n <= 1
  (n -= 1) * gamma_fnc(n)
end

# Test Cases
# p gamma_fnc(0)# == nil # => returns nil
# p gamma_fnc(1)# == 1 # => returns 1
# p gamma_fnc(4)# == 6 # => returns 6
# p gamma_fnc(8)# == 5040 # => returns 5040


#Problem 1: You have array of integers. Write a recursive solution to find the
#sum of the integers.

def sum_recur(array)
  return array.first if array.length <= 1
  array.first + sum_recur(array[1..-1])
end

# p sum_recur([1,2,3,4,5])
# p sum_recur([0,1,2])

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
