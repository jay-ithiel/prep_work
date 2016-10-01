require 'byebug'
require_relative 'display'
require_relative 'board'
require_relative 'player'
# require_relative 'pieces'

class Game
  attr_reader :display, :board, :current_player

  def initialize(board, player_one, player_two)
    @board, @player_one, @player_two = board, player_one, player_two
    @display = Display.new(board)
    @current_player = player_one
    @standby_player = player_two
  end

  def change_player!
    # @current_player = @current_player == @player_one ? @player_two : @player_one
    @current_player, @standby_player = @standby_player, @current_player
  end

  def play
    puts "Starting the game now!"

    until won?
      puts "#{@current_player.name}'s turn"
      @current_player.play_turn

      # cursor_input = @display.get_cursor_input

      while true
        cursor_input = @display.get_cursor_input
        start_pos = @display.cursor_pos

        if cursor_input == :return && valid_pick_up?(start_pos)
          @current_player.piece_in_hand = true
          @current_player.piece_dropped = false
          break
        end
        # break if cursor_input == :return && @current_player.piece_in_hand
      end

      while true
        cursor_input = @display.get_cursor_input
        end_pos = @display.cursor_pos
        if cursor_input == :return && valid_drop?(end_pos)
          @current_player.piece_dropped = true
          @current_player.piece_in_hand = false
          break
        end
      end

      change_player!
    end

    puts "Game is over! The winner is "
  end

  def won?
    @board.checkmate?(@standby_player.color)
  end

  def valid_pick_up?(cursor_pos)
    piece = board[cursor_pos]
    return false if @current_player.color != piece.player.color
    return false if piece.is_a?(NullPiece)
    true
  end

  def valid_drop?(cursor_pos)

  end


end


if __FILE__ == $PROGRAM_NAME
  player1 = HumanPlayer.new('player1', :grey)
  player2 = HumanPlayer.new('player2', :white)
  board = Board.new(player1, player2)
  chess = Game.new(board, player1, player2)
  chess.play
end
