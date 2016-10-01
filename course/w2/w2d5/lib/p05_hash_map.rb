require 'byebug'
require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    hash = key.hash
    @store[hash % num_buckets].include?(key)
  end

  def set(key, val)
    resize! if @count >= num_buckets
    hash = key.hash
    @store[hash % num_buckets].insert(key, val)
    @count += 1
  end

  def get(key)
    hash = key.hash
    @store[hash % num_buckets].get(key)
  end

  def get_node(key)
    hash = key.hash
    @store[hash % num_buckets].get_node(key)
  end

  def delete(key)
    hash = key.hash
    @store[hash % num_buckets].remove(key)
    @count -= 1
  end

  def [](i)
    get(i)
  end

  def each
    @store.each do |list|
      list.each do |link|
        yield link.key, link.val
      end
    end
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    elements = self.dup
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    elements.each do |k, v|
      set(k, v)
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
