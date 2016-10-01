require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :player1, :player2, :current_player, :board

  def initialize(player1, player2)
    @player1, @player2 = player1, player2
    @player1.mark, @player2.mark = :X, :O
    @current_player = player1
    @board = Board.new
  end

  def switch_players!
    @current_player == player1 ? @current_player = player2 : @current_player = player1
  end

  def play_turn
    @board.place_mark(current_player.get_move, @current_player.mark)
    @current_player.display
    switch_players!
  end

  def play
    @current_player.display

    until @board.over?
      play_turn
    end

    if @board.winner == nil
      p "Tie"
    else
      p "#{@board.winner} wins!"
    end
  end
end
