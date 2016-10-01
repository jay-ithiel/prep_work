# MyQueue
#
# Implement a Queue class. Use the following initialize method as a starting point:
#
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.count
  end

  def empty?
    @store.count == 0 ? true : false
  end
end
# Implement enqueue, dequeue, peek, size, and empty? methods on your Queue.
#
# MyStack
#
# Implement a Stack class. Use the following initialize method as a starting point:
#
class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(elem)
    elem_data = {
      value: elem,
      max: 0,
      min: 0
    }

    if empty?
      elem_data[:max] = elem && elem_data[:min] = elem
    else
      if elem > peek[:max]
        elem_data[:max] = elem
      else
        elem_data[:max] = peek[:max]
      end

      if elem < peek[:min]
        elem_data[:min] = elem
      else
        elem_data[:min] = peek[:min]
      end
    end

    @store << elem_data
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def peek
    @store.last
  end

  def max
    peek[:max]
  end

  def min
    peek[:min]
  end
end
# Implement pop, push, peek, size, and empty? methods on your Stack.


class StackQueue

  def initialize
    @in_stack = MyStack.new
    @out_stack = MyStack.new
  end

  def enqueue(elem)
    @in_stack.push(elem)
  end

  def dequeue
    if @out_stack.empty?
      @in_stack.size.times { @out_stack.push(@in_stack.pop) }
    else
      @out_stack.pop
    end
  end

  def size
    @in_stack.size + @out_stack.size
  end

  def empty?
    @in_stack.empty? && @out_stack.empty?
  end

end
