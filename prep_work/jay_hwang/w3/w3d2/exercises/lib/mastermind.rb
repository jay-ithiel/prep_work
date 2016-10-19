require 'byebug'
# There are six different peg colors:
# Red
# Green
# Blue
# Yellow
# Orange
# Purple

class Code
  attr_reader :pegs

  PEGS = {
    'R' => 'Red',
    'G' => 'Green',
    'B' => 'Blue',
    'Y' => 'Yellow',
    'O' => 'Orange',
    'P' => 'Purple'
  }

  def initialize(pegs)
    @pegs = pegs
  end

  def self.parse(color_codes)
    peg_colors = PEGS.keys
    filtered_codes = []
    color_codes.chars.each do |color_code|
      raise Error if peg_colors.join('').match(/#{color_code}/i) == nil
      filtered_codes << color_code.upcase
    end
    Code.new(filtered_codes)
  end

  def self.random
    random_pegs = []
    4.times do
      random_pegs << self.gen_rand_peg
    end
    Code.new(random_pegs)
  end

  def self.gen_rand_peg
    key_index = rand(4) + 1
    peg_colors = PEGS.keys
    peg_colors[key_index]
  end

  def [](arg)
    @pegs[arg]
  end

  def exact_matches(code)
    match_count = 0
    code.pegs.each_with_index do |color_code, color_code_idx|
      @pegs.each_with_index do |peg, peg_idx|
        match_count += 1 if peg == color_code && color_code_idx == peg_idx
      end
    end
    match_count
  end

  def near_matches(code)
    self_pegs, code_pegs = self.pegs, code.pegs
    match_count = 0
    self_pegs.each_with_index do |peg, peg_idx|
      code_pegs.each_with_index do |color_code, color_code_idx|
        if color_code == peg && peg != nil
          match_count += 1 unless self_pegs[color_code_idx] == color_code
          code_pegs[color_code_idx], self_pegs[peg_idx] = nil, nil
          break if peg_idx == self_pegs.length - 1
        end
      end
    end
    match_count
  end

  def ==(code)
    return false unless code.is_a?(Code)
    self.pegs === code.pegs
  end
end

class Game
  attr_reader :secret_code

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def get_guess
    Code.parse(@secret_code.pegs.join(''))
  end

  def display_matches(code)
    exact_matches = @secret_code.exact_matches(code)
    near_matches = @secret_code.near_matches(code)

    puts "You got #{exact_matches} exact matches!"
    puts "You got #{near_matches} near_matches!"
  end
end
