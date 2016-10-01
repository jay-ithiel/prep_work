require_relative '00_tree_node'

class KnightPathFinder

  def self.valid_moves(pos)
    row, col = pos
    valid_moves = []

    (row-2..row+2).to_a.each do |r|
      (col-2..col+2).to_a.each do |c|
        next if KnightPathFinder.check_pos(pos, r, c)
        valid_moves << [r,c]
      end
    end

    valid_moves
  end

  def self.check_pos(pos, r, c)
    KnightPathFinder.square_corners(pos, r,c) ||
      KnightPathFinder.cross(pos, r,c) ||
        KnightPathFinder.out_of_bounds?(r, c)
  end

  def self.out_of_bounds?(r, c)
    (r < 0 || r > 7 || c < 0 || c > 7) ? true : false
  end

  def self.cross(pos, r,c)
    row, col = pos
    row == r || col == c ? true : false
  end

  def self.square_corners(pos, r, c)
    row, col = pos
    row_diff = (row - r).abs
    col_diff = (col - c).abs

    [1,2].each do |i|
      return true if row_diff == i && col_diff == i
    end

    false
  end

  attr_reader :pos, :move_tree, :visited_positions

  def initialize(pos = [0,0])
    @pos = pos
    @visited_positions = []
    @move_tree = build_move_tree
  end

  def find_path(end_pos)
    # end_pos_node = PolyTreeNode.new(end_pos)
    end_pos_node = @move_tree.bfs(end_pos)
    path = trace_path_back(end_pos_node).reverse
  end

  def trace_path_back(end_pos_node)
    path = []
    current_node = end_pos_node

    until !current_node.parent
      path << current_node.value
      current_node = current_node.parent
    end

    path << current_node.value
  end

  def build_move_tree
    queue = [ PolyTreeNode.new(@pos) ]
    original_node = queue.first

    until queue.empty?
      current_node = queue.shift
      pos = current_node.value

      new_moves = new_move_positions(pos)

      new_nodes = new_moves.map do |move|
        PolyTreeNode.new(move)
      end

      new_nodes.each do |node|
        current_node.add_child(node)
        @visited_positions << node.value
      end

      queue += new_nodes
    end

    original_node
  end

  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos)

    new_moves.reject! do |move|
      @visited_positions.include?(move)
    end

    @visited_positions += new_moves
    new_moves
  end
end
