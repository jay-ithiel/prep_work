# A HumanPlayer class, responsible for translating user input into positions
# of the form [x, y]

class HumanPlayer

  def get_play(*args)
    puts "Where would you like to attack? (row, column)"
    atk_pos = gets.chomp!
    atk_pos.split('').map(&:to_i)
  end

end
