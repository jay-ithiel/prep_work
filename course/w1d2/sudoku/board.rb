require_relative 'tile'

class Board

  def initialize(grid)
    @grid = grid
  end


  def self.from_file
    puts "Which sudoku file do you want to load?"
    file_name = gets.chomp

    grid = []

    File.readlines(file_name).each do |line|
      row = []

      line.chars.each do |char|
        if char == 0
          row << Tile.new
        else
          row << Tile.new(char.to_i)
        end
      end

      grid << row
    end

    Board.new(grid)
  end

  def render
    @grid.each do |row|
      row_arr = []

      row.each do |tile|
        row_arr << tile.to_s
      end

      puts row_arr.join(' ')
    end
  end

  def solved?
    check_rows && check_cols && check_box
  end

  def update_tile(pos, value)
    tile = self[pos]
    tile.value = value
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, tile)
    row, col = pos
    @grid[row][col] = tile
  end

  private

    def check_rows(grid = @grid)
      grid.each do |row|
        temp_row = row.map { |tile| tile.value }
        return false if temp_row.sort != (1..9).to_a
      end
      true
    end

    def check_cols
      col_grid = []
      @grid.length.times do |i|
        col = []
        @grid.each { |row| col << row[i] }
        col_grid << col
      end
      check_rows(col_grid)
    end

    def check_box
      box_grid = []
      first_nine, sec_nine, third_nine = [], [], []

      @grid.each do |row|

        row.length.times do |i|

          if i < 3
            first_nine << row[i]
          elsif i < 6# && i > 2
            sec_nine << row[i]
          else
            third_nine << row[i]
          end

        end # row.length.times do |i|

        if third_nine.length == 9
          box_grid.push(first_nine, sec_nine, third_nine)
          first_nine, sec_nine, third_nine = [], [], []
        end

      end #  @grid.each do |row|

      check_rows(box_grid)
    end # check box method

end # Game class
