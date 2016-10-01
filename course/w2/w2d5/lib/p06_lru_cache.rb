require 'byebug'
require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count, :map, :store
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    link = @map[key]
    if link.nil?
      calc!(key)
    else
      update_link!(link)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    new_link = @store.insert(key, val)
    @map[key] = new_link
    eject! if count > @max
    val
  end

  def update_link!(node)
    # suggested helper method; move a link to the end of the list
    node.prev.next = node.next
    node.next.prev = node.prev
    node.prev = @store.last
    @store.last.next = node
    @store.tail.prev = node
    node.next = @store.tail
  end

  def eject!
    # byebug
    delete_me = @store.first
    delete_me.prev.next = delete_me.next
    delete_me.next.prev = delete_me.prev

    @map.delete(delete_me.key)
  end
end
