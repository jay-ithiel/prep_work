class MyTest
  attr_accessor :value

  def initialize
    @value = (1..3).to_a.sample
  end
end

class MyTest2 < MyTest

end

my_test = MyTest2.new
# p my_test.value

# test1 = MyTest.new
# test2 = test1.dup
#
# p test1.value
# p test2.value
#
#
# test1.value = 'hello'
# p test1.value
# p test2.value

known_cards = {
  a: [[1, 1], [2,2]],
  b: [[3, 3]],
  c: [[4, 4], [5, 5]]
}

p known_cards.values.select { |value| value.length == 2 }
