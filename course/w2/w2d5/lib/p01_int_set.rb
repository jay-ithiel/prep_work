require 'set'

class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    end
  end

  def remove(num)
    if is_valid?(num)
      @store[num] = false
    end
  end

  def include?(num)
    if is_valid?(num)
      store[num]
    end
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num >= max || num < 0
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num%20] << num unless self.include?(num)
  end

  def remove(num)
    @store[num%20].delete(num)
  end

  def include?(num)
    @store[num%20].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(buckets = 20)
    @store = Array.new(buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= num_buckets
    @store[num%num_buckets] << num unless self.include?(num)
    @count += 1
  end

  def remove(num)
    @store[num%num_buckets].delete(num)
  end

  def include?(num)
    @store[num%num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    elements = @store.dup.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    elements.each {|num| insert(num)}
  end
end
