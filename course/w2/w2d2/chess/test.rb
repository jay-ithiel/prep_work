class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize
    super
  end
end

dog = Dog.new('dog')
p dog.name
