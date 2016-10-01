class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    mem_addresses = self.map{|x| x.object_id.to_s}
    mem_addresses.shuffle(random: Random.new(10))
    mem_addresses.join('').to_i
  end
end

class String
  def hash
    arr = self.split('')
    mem_addresses = arr.map{|x| x.ord.to_s}
    mem_addresses.shuffle(random: Random.new(10))
    mem_addresses.join('').to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    mem_addresses = self.map {|k,v| k.to_s.ord * v.to_s.ord}
    new_addresses = mem_addresses.sort.shuffle(random: Random.new(10))
    new_addresses.join('').to_i
  end
end
