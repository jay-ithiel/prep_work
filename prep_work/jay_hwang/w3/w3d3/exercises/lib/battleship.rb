# A BattleshipGame class to enforce rules and run the game. The game should keep
# a reference to the Player, as well as the Board. Some (possibly) useful methods:

# BattleshipGame#play: runs the game by calling play_turn until the game is over.
# BattleshipGame#play_turn: gets a guess from the player and makes an attack.
# BattleshipGame#attack(pos): Marks the board at pos, destroying or replacing
#                                               any ship that might be there.
# BattleshipGame#display_status: Prints information on the current state of the
#                 game, including board state and the number of ships remaining.

class BattleshipGame
  attr_reader :board, :player

  def initialize(player = HumanPlayer.new, board = Board.random)
    @board = board
    @player = player
  end

  def attack(position)
    @board[position] = :x
  end


  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  # BattleshipGame#play: runs the game by calling play_turn until the game is over.
  # BattleshipGame#play_turn: gets a guess from the player and makes an attack.
  def play_turn
    pos = @player.get_play
    attack(pos)
  end

  def play
    until game_over?
      play_turn
    end
  end

end
