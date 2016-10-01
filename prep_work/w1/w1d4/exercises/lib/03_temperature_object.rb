class Temperature
  def initialize(temp_hash = {})
    if temp_hash[:f]
      self.fahrenheit = temp_hash[:f]
    else
      self.celsius = temp_hash[:c]
    end
  end


  def in_fahrenheit
    self.class.c_to_f(@temp)
  end

  def in_celsius
    @temp
  end


  def self.f_to_c(degree)
    (degree - 32) * (5.0 / 9.0)
  end

  def self.c_to_f(degree)
    degree * (9.0 / 5.0) + 32
  end


  def self.from_celsius(degree)
    self.new(c: degree)
  end

  def self.from_fahrenheit(degree)
    self.new(f: degree)
  end


  def celsius=(temp)
    @temp = temp
  end

  def fahrenheit=(temp)
    @temp = self.class.f_to_c(temp)
  end

end

class Celsius < Temperature
  def initialize(degree)
    self.celsius = degree
  end
end

class Fahrenheit < Temperature
  def initialize(degree)
    self.fahrenheit = degree
  end
end
