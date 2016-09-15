# # # Calculator
# #
# # you will build a simple calculator script with the following methods:
# #
# # `add` takes two parameters and adds them
# #
# # `subtract` takes two parameters and subtracts the second from the first
# #
# # `sum` takes an *array* of parameters and adds them all together
# #
# # # Warning
# #
# # You may not have enough knowledge yet to complete `sum`. You will
# # probably need to use **loops** (e.g. `while`) or **iterators**
# # (e.g. `each`) to get the tests to pass.

# def add(n1, n2)
#     n1 + n2
# end

# def subtract(n1, n2)
#     n1 - n2
# end

# def sum(array)
#     array.inject(:+) || 0
# end


# # # Bonus
# #
# # There are also some bonus exercises for when you finish the regular
# # ones. The bonus round will help teach you test-driven *development*,
# # not simply test-guided *learning*.
# #
# # Your mission, should you choose to accept it, is to write *tests*
# # for three new methods:
# #
# # * `multiply` which multiplies two numbers together
# # * `power` which raises one number to the power of another number
# # * `[factorial](http://en.wikipedia.org/wiki/Factorial)` (check
# #   Wikipedia if you forgot your high school math).

# def multiply(array)
#     array.inject(:*) || 0
# end

# def power(n1, n2)
#     n1 ** n2
# end

# def factorial(n)
#     (n-1).downto(1) do |num|
#         n*=num
#     end
#     n
# end

def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  num1 - num2
end

def sum(arr)
  arr.reduce(:+) || 0
end

def multiply(arr)
  arr.reduce(:*)
end

def power(num, pow)
  num ** pow
end

def factorial(num)
  (num-1).downto(1) do |n|
    num *= n
  end
  num
end
