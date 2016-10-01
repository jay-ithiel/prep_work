require 'byebug'

class RPNCalculator
  attr_accessor :calculator, :value

  def initialize(calculator = [])
    @calculator = calculator
  end

  def push(num)
    @calculator << num
  end

  def plus
    calculate(:+)
  end

  def minus
    calculate(:-)
  end

  def divide
    calculate(:/)
  end

  def times
    calculate(:*)
  end

  def calculate(operator)
    calc_empty

    if operator == :/
      @value = @calculator.pop(2).map { |n| n.to_f }.reduce(operator)
    else
      @value = @calculator.pop(2).reduce(operator)
    end

    @calculator << @value
    @value
  end

  def calc_empty
    raise "calculator is empty" if @calculator.count < 2
  end

  def tokens(string)
    string.split.map do |el|
      if el.match(/[0-9]/) != nil
        el.to_i
      else
        el.to_sym unless el.match(/[0-9a-z]/i) != nil
      end
    end
  end

  def evaluate(string)
    
    string.split.each do |oper|
      if oper.match(/[0-9]/)
        push(oper.to_i)
      else
        calculate(oper.to_sym)
      end
    end

    @calculator.last
  end

end
