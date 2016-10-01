class PolyTreeNode

  attr_reader :value, :parent,
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    if node
      @parent = node
      node.children << self
    end
  end

  
end
