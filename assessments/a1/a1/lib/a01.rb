class Array
  # Write a method that binary searches an array for a target and returns its
  # index if found. Assume a sorted array

  # NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
  # We will not give you points if you visit every element in the array every time
  # you search.

  # For example, given the array [1, 2, 3, 4], you should NOT be checking
  # 1 first, then 2, then 3, then 4.

  def binary_search(target)
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
  end
end

# Write a method called 'sum_rec' that
# recursively calculates the sum of an array of values
def sum_rec(nums)
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
  end
end

def prime?(num)
end

# Write a method that sums the first n prime numbers starting with 2.
def sum_n_primes(n)
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
  end
end

class Array
  # Write a method that returns the first element that causes the passed block
  # to evaluate to `true`
  def my_find(&prc)
  end
end

