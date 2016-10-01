class PolyTreeNode

  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    if @parent
      @parent.children.delete(self)
      @parent = nil
    end
    if new_parent
      @parent = new_parent
      new_parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child)
    raise if !@children.include?(child)
    child.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    self.children.each do |child|
      search_result = child.dfs(target_value)
      return search_result if search_result
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty?

      current_node = queue.shift
      return current_node if current_node.value == target_value

      queue += current_node.children
    end

    nil
  end
end
