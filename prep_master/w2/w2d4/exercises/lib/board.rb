class Board
  attr_reader :grid

  def initialize(grid = Array.new(3) { Array.new(3) })
    @grid = grid
  end

  def [](position)
    row, col = position
    grid[row][col]
  end

  def []=(position, sym)
    row, col = position
    grid[row][col] = sym
  end

  def place_mark(position, sym)
    self[position] = sym
  end

  def empty?(position)
    self[position] === nil
  end

  def winner
    (@grid + column_symbols + diagonal_symbols).each do |row|
      return :X if row == [:X, :X, :X]
      return :O if row == [:O, :O, :O]
    end
    nil
  end

  def over?
    @grid.each do |row|
      return false if row.include?(nil)
      return true if winner != nil
    end
    true
  end

  def column_symbols
    col_symbols = [[], [], []]
    @grid.each do |row|
      row.each_with_index do |symbol, column_idx|
        col_symbols[column_idx] << symbol
      end
    end
    col_symbols
  end

  def diagonal_symbols
    diag1 = [[0,0], [1,1], [2,2]]
    diag2 = [[0,2], [1,1], [2,0]]
    [diag1, diag2].map do |diag|
      diag.map { |row, col| grid[row][col] }
    end
  end

end
