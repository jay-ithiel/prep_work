require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(buckets = 8)
    @store = Array.new(buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count >= num_buckets
    @store[num.hash%num_buckets] << num unless self.include?(num)
    @count += 1
  end

  def remove(num)
    @store[num.hash%num_buckets].delete(num)
  end

  def include?(num)
    @store[num.hash%num_buckets].include?(num)
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
