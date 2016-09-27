require 'byebug'
class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil)
    accumulator ||= self.shift

    self.each do |el|
      if block_given?
        accumulator = yield accumulator, el
      end
    end

    accumulator
  end

end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  return false if num < 2
  (2...num).to_a.each do |div|
    return false if num % div == 0
  end
  true
end

def primes(num)
  num_primes = []
  n = 2

  until num_primes.count == num
    num_primes << n if is_prime?(n)
    n+=1
  end

  num_primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

# 4 => [1,1,2,6]
# 3 * 2
# 2 *
def factorials_rec(num)
  return [] if num <= 0
  return [1] if num == 1
  facs = factorials_rec(num - 1)
  next_fac = facs.last * (num - 1)
  facs += [next_fac]
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    dup_hash = {}

    self.each.with_index do |el, i|
      if self.count(el) > 1
        if dup_hash[el]
          dup_hash[el] << i
        else
          dup_hash[el] = [i]
        end
      end
    end

    dup_hash
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    sym_subs = []

    self.length.times do |i|
      (i..self.length-1).each do |i2|
        substr = self[i..i2]
        if substr.length > 1 && substr.is_palindrome?
          sym_subs << substr unless sym_subs.include?(substr)
        end
      end
    end

    sym_subs
  end

  def is_palindrome?
    self.reverse == self
  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.
  def merge_sort(&prc)
    return self if self.count <= 1
    prc ||= Proc.new { |a, b| a <=> b }

    mid = self.count / 2
    left, right = self.take(mid), self.drop(mid)

    Array.merge(left.merge_sort(&prc), right.merge_sort(&prc), &prc)
  end

  private

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      first_left = left.first
      first_right = right.first

      case prc.call first_left, first_right
      when 1
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
