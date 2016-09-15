class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @mark = :O
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    empty_positions = get_empty_pos
    empty_positions.each do |empty_pos|
      return empty_pos if self.win_move?(empty_pos)
    end

    empty_positions[rand(3)]
  end

  def get_empty_pos
    empty_pos = []
    row, col = 0, 0
    row.upto(2) do |row_idx|
      col.upto(2) do |col_idx|
        position = [row_idx, col_idx]
        empty_pos << position if @board.empty?(position)
      end
    end
    empty_pos
  end

  def win_move?(pos)
    @board.place_mark(pos, @mark)
    if @board.winner != nil
      @board[pos] = nil
      true
    else
      @board.place_mark(pos, nil)
      false
    end
  end
end
