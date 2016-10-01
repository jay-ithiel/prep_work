class Board

  attr_accessor :grid

  def initialize
    @grid = []
  end
end

class Piece
  attr_accessor :name, :board

  def initialize(name, board)
    @name = name
    @board = board
  end
end


board = Board.new
piece1 = Piece.new('piece1', board)
piece1.board.grid << 'hello world'

piece2 = Piece.new('piece2', board)
piece2.board.grid << 'goodbye world'

p piece1.board.grid
p piece2.board.grid
