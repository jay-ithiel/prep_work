require 'byebug'
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

  if array.count.even?
    mid_idx = (array.count / 2) - 1
  else
    mid_idx = array.count / 2
  end
  first_half = array[0..mid_idx]
  sec_half = array[mid_idx+1..-1]

  case target <=> array[mid_idx]

  when -1
    bsearch(first_half, target)
  when 0
    return mid_idx
  when 1
    sec_half_bsearch = bsearch(sec_half, target)
    sec_half_bsearch.nil? ? nil : mid_idx + 1 + sec_half_bsearch
  else
    return nil
  end

end
#
p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# Implement a method merge_sort that sorts an Array:

def merge_helper(array1, array2)
  sorted = []

  while array1.length > 0 #shorter_array > 0
    el1, el2 = array1.first, array2.first
    break if el1 == nil || el2 == nil
    # byebug
    if el1 <= el2
      sorted << el1
      array1.shift
    elsif el1 > el2
      sorted << el2
      array2.shift
    end
  end

  sorted + array1 + array2
end

def merge_sort(array)
  # [2,3,1,4]
  return array if array.length == 1

  if array.count.even?
    mid_idx = array.length / 2
  else
    mid_idx = (array.length / 2) + 1
  end

  first_half = array[0..mid_idx-1]
  sec_half = array[mid_idx..-1]

  merge_helper(merge_sort(first_half), merge_sort(sec_half))
end

# p merge_helper([2,4,15,205,10259], [1,3,5])
# p merge_sort([3,1])
