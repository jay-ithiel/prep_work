require_relative 'board'
require_relative 'player'

class Game

  def initialize(player, board)
    @player = player
    @board = board
  end

  def play
    until over
      @board.render
      card1 = show_move
      card2 = show_move
      @board.render
      make_guess(card1, card2)
      # system("clear")
    end
  end

  def show_move
    guess = @player.prompt
    card = @board[guess]
    card.reveal
    puts card.face_value
    card
  end

  def over
    @board.won?
  end

  def make_guess(card1, card2)
    if card1 != card2
      # sleep(2)
      card1.hide
      card2.hide
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new
  game = Game.new(ComputerPlayer.new('player', board), board)
  game.play
end
