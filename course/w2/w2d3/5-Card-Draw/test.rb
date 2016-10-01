def my_test(arg)
  puts arg
end


def my_test2(arg)
  puts "hello #{arg}"
end
#
# class MyTest
#   def initialize(name)
#     @name = name
#   end
# end

a = [my_test]
a.each do |method|
  method('name')
end
