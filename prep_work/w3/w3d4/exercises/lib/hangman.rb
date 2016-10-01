class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @players = players
    @guesser = players[:guesser]
    @referee = players[:referee]
    @board = []
  end

  def setup
    @referee.pick_secret_word
    secret_word_length = @referee.pick_secret_word
    secret_word_length.times { @board << "_" }
    @guesser.register_secret_length(secret_word_length)
  end

  def take_turn
    guess = @guesser.guess(@board)
    matching_idxs = @referee.check_guess(@guesser.guess)
    update_board(guess, matching_idxs)
    @guesser.handle_response(guess, matching_idxs)
  end

  def update_board(letter, idxs)
    idxs.each do |idx|
      @board[idx] = letter
    end
  end

  def play
  end

end

class HumanPlayer
end

class ComputerPlayer
  attr_reader :candidate_words

  def initialize(dictionary)
    @dictionary = dictionary
    @candidate_words = dictionary
  end

  def pick_secret_word
    word_idx = rand(@dictionary.length)
    @secret_word = @dictionary[word_idx]
    @secret_word.length
  end

  def check_guess(letter)
    match_idxs = []
    if @secret_word.chars.include?(letter)
      @secret_word.chars.each_with_index do |char, i|
        match_idxs << i if char == letter
      end
      return match_idxs
    else
      match_idxs
    end
  end

  def register_secret_length(length)
    @secret_word ||= []
    length.times { @secret_word << '_'}
    @candidate_words.reject! { |word| word.length != length }
  end

  def guess(board)
    @candidate_words = get_possible_words(board)
    mcl, mcl_count = nil, 0
    @candidate_words.join('').chars.uniq.each do |letter|
      letter_count = @candidate_words.join('').chars.count(letter)
      if letter_count > mcl_count && !board.include?(letter)
        mcl, mcl_count = letter, letter_count
      end
    end
    @guess = mcl
  end

  def handle_response(letter, matching_idxs)
    if matching_idxs.length > 0
      @candidate_words.reject! do |word|
        !matching_idx?(word, letter, matching_idxs)
      end
    else
      @candidate_words.reject! do |word|
        word.chars.include?(letter)
      end
    end
  end

  def matching_idx?(word, letter, secret_idxs)
    word_idxs = []
    word.chars.each_with_index do |char, i|
      word_idxs << i if char == letter
    end
    word_idxs === secret_idxs
  end

  def get_known_letters_and_idxs(board)
    known_letters = board.scan(/[a-z]/i)
    known_letters_and_idxs = {}
    known_letters.each { |letter| known_letters_and_idxs[letter] = [] }

    board.each_with_index do |letter, index|
      known_letters_idxs[letter] << index
    end

    known_letters_and_idxs
  end

  def get_possible_words(board)
    possible_words = @dictionary.select { |word| word.length == board.length }
    known_letters = board.join('').scan(/[a-z]/i)

    known_letters.each do |letter|
      possible_words.reject! { |word| !word.include?(letter) }
    end

    possible_words
  end

end

if __FILE__ == $PROGRAM_NAME
  p "Would you like to be the guesser or referee?"
  human_player_role = gets.chomp.downcase!

  human_player = HumanPlayer.new
  comp_player = ComputerPlayer.new

  players = {
    :guesser => nil,
    :referee => nil
  }

  if human_player_role == 'guesser'
    players[:guesser] = human_player
    players[:referee] = comp_player
  else
    guesser = comp_player
    referee = human_player
  end

  Hangman.new(players).play
end
