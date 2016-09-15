require 'byebug'

require_relative 'player.rb'

class Game
  def initialize(dictionary, player1, player2)
    @dictionary = dictionary
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @fragment = ""
  end

  def play_round

  end

  def switch_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def valid_play?(string)
    return false if string.match(/[a-z]/i) == nil
    shorten_dictionary(string)
    return false if @new_dictionary.empty?
    true
  end

  def take_turn(player)
    move = player.get_move
    until valid_play?(move)
      p "Invalid play. Please try again"
      move = player.get_move
    end
    move
  end

  def play_round

    @fragment << take_turn(@current_player)

    until round_lose
      @fragment << take_turn(@current_player)
      switch_player
    end

    @current_player.loss_count += 1
    @current_player.print_loss
  end

  def shorten_dictionary(string)
    if @fragment.length == 0
      @new_dictionary = @dictionary[string]
      # byebug
      # p ''
    else
      temp_frag = @fragment << string
      @new_dictionary = @new_dictionary.select {|n| n[0...temp_frag.length] == temp_frag }
      p @new_dictionary
    end
  end

  def round_lose
    @fragment == @new_dictionary[0] ? true : false
  end

  def run
    until @player1.loss_count == 5 || @player2.loss_count == 5
      play_round
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  hash = {}
  File.open('dictionary.txt').each do |word|
    if hash[word[0]]
      hash[word[0]] << word.chomp!
    else
      hash[word[0]] = [word.chomp!]
    end
  end
# p hash['a']
  player1 = Player.new("A")
  player2 = Player.new("B")
  game = Game.new(hash, player1, player2)
  game.run
end
