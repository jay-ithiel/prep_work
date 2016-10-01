require 'colorize'
require_relative 'tile'
require 'byebug'

class Board
  attr_reader :size, :boom

  def initialize(size = 9, bomb_count = 10)
    @size = size
    @board = Array.new(size) { Array.new(size) }
    @bomb_count = bomb_count
    @boom = false
    populate_board
    place_bombs(bomb_count)
  end

  def render
    puts "  #{(0...size).to_a.map { |n| n.to_s.colorize(:yellow) }.join(" ")}"
    @board.each_with_index do |row, i|
      print "#{i} ".colorize(:yellow)
      values = []
      row.each do |tile|
        if tile.flag
          values << 'F'#.colorize(:red)
        elsif tile.is_0? && tile.revealed?
          values << ' '
        elsif tile.revealed?
          values << tile.value
        else
          values << '*'
        end
      end
      puts color(values).join(' ')
    end
  end

  def render_full
    puts "  #{(0...size).to_a.map { |n| n.to_s.colorize(:yellow) }.join(" ")}"
    @board.each_with_index do |row, i|
      print "#{i} ".colorize(:yellow)#{}"#{i} "
      values = []
      row.each do |tile|
        values << (tile.is_0? ? ' ' : tile.value)
      end
      puts color(values).join(' ')
    end
    
  end

  def color(values)
    colored_values = []
    values.each do |value|
      case value
      when :B
        colored_values << value.to_s.colorize(:black).on_red
      when 'F'
        colored_values << value.colorize(:red)
      else
        colored_values << value
      end
    end
    colored_values
  end

  def populate_board
    @size.times do |row|
      @size.times do |col|
        self[[row,col]] = Tile.new([row, col])
      end
    end
  end

  def place_bombs(bomb_count)
    until bomb_count == 0
      rand_row, rand_col = rand(size), rand(size)
      rand_pos = [rand_row, rand_col]
      tile = self[rand_pos]
      if tile.value != :B
        tile.value = :B
        update_neighbors(rand_pos)
        bomb_count -= 1
      end
    end
  end

  def update_neighbors(pos)
    neighbors(pos).each do |neighbor|
      next if neighbor.is_bomb?
      neighbor.value += 1
    end
  end

  def reveal_neighbors(pos)
    neighbors = neighbors(pos).sort { |a, b| b.value <=> a.value }
    neighbors.reject! { |tile| tile.revealed? }
# p neighbors
    neighbors.each do |tile|
      if !tile.is_0?
        tile.reveal unless tile.is_bomb? || tile.flag
      elsif tile.is_0?
        tile.reveal
        reveal_neighbors(tile.pos)
      end
    end

  end


  def flag(pos)
    self[pos].toggle_flag
  end

  def reveal(pos)
    tile = self[pos]
    if tile.flag
      puts "Cannot reveal a flagged tile"
      puts "Please unflag the tile first"
    else
      boom! if tile.is_bomb?
      reveal_neighbors(pos) if tile.is_0?
      tile.reveal
    end
  end

  def neighbors(pos)
    neighbors = []
    (-1..1).each do |row_offset|
      (-1..1).each do |col_offset|
        n_row , n_col = (pos[0] + row_offset), (pos[1] + col_offset)
        next if out_of_range?(n_row) || out_of_range?(n_col)
        tile = self[[n_row, n_col]]
        neighbors << tile
      end
    end
    neighbors
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

  def out_of_range?(num)
    num >= size || num < 0
  end

  def over?
    @board.each do |row|
      row.each do |tile|
        if tile.revealed? == false
          return false unless tile.is_bomb?
        end
      end
    end
    true
  end

  def boom!
    @boom = true
  end

end

# def reveal_neighbors(pos)
#   row , col = pos
#
#   Board.neighbor_offsets.each do |offset|
#     offset_row, offset_col = offset
#     n_row, n_col = (row + offset_row), (col + offset_col)
#     next if out_of_range?(n_row) || out_of_range?(n_col)
#     n_pos = [n_row, n_col]
#     n_tile = self[n_pos]
#     n_tile.reveal #unless n_tile.is_bomb?
#     if n_tile.is_0? && !n_tile.revealed?
#       reveal_neighbors(n_pos)
#     end
#   end
# end
