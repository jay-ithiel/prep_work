class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail #? false : true
  end

  def get(key)
    checker = first
    return nil if checker.nil?
    until checker == @tail
      return checker.val if checker.key == key
      checker = checker.next
    end
    nil
  end

  def include?(key)
    get(key).nil? ? false : true
  end

  def insert(key, val)
    remove(key) if include?(key)
    new_link = Link.new(key, val)
    @head.next = new_link if @head.next == @tail
    new_link.next = @tail
    new_link.prev = @tail.prev
    new_link.prev.next = new_link
    @tail.prev = new_link
  end

  def insert_node(key)
    remove(key) if include?(key)
    node = get_node(key)
    @head.next = node if @head.next == @tail
    node.next = @tail
    node.prev = @tail.prev
    node.prev.next = node
    @tail.prev = node
  end

  def remove(key)
    node_to_remove = get_node(key)
    raise 'cannot remove head or tail' if node_to_remove == @head ||
                                          node_to_remove == @tail
    raise 'cannot remove non-existing key' if node_to_remove.nil?
    node_to_remove.next.prev = node_to_remove.prev
    node_to_remove.prev.next = node_to_remove.next
  end


  def get_node(key)
    checker = first
    # return nil if checker.nil?
    until checker == @tail
      return checker if checker.key == key
      checker = checker.next
    end
    # nil
  end

  def each
    checker = first
    return nil if checker.nil?
    until checker == @tail#.prev
      # return checker if checker.key == key
      yield checker
      checker = checker.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
