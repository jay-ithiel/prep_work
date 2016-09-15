require 'byebug'
# A Board class with an underlying grid (a two-dimensional Array), where each
# element in a row represents a ship, open water, or a space that has already
# been attacked. I used the symbol :s to represent an undamaged ship (or ship
# segment), nil for empty space, and :x to represent a destroyed space.

# Useful Board methods:
# Board#display: prints the board, with marks on any spaces that have been fired upon.
# Board#count: returns the number of valid targets (ships) remaining
# Board#populate_grid to randomly distribute ships across the board
# Board#in_range?(pos)

class Board
  attr_reader :grid

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def count
    ship_count = 0
    @grid.each do |row|
      ship_count += row.count(:s)
    end
    ship_count
  end

  def empty?(position = nil)
    if position
      self[position] === nil
    else
      self.count === 0
    end
  end

  def full?
    @grid.each do |row|
      return false if row.include?(nil)
    end
    true
  end

  def place_random_ship
    raise Error if full?
    position = gen_rand_pos
    position = gen_rand_pos until empty?(position)
    self[position] = :s
  end

  def gen_rand_pos
    grid_size = @grid.length
    [rand(grid_size), rand(grid_size)]
  end

  def won?
    @grid.each do |row|
      return false if row.include?(:s)
    end
    return true
  end
end
