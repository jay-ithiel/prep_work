class Fixnum

  ONES = {
    0 => 'zero',
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine'
  }

  TENS = {
    10 => 'ten',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }

  TEENS = {
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen'
  }

LARGE_SCALES = {
    100 => 'hundred',
    1000 => 'thousand',
    1_000_000 => 'million',
    1_000_000_000 => 'billion',
    1_000_000_000_000 => 'trillion'
  }


  def in_words
    if self < 10
      return ONES[self]
    elsif self < 20 && self > 10
      return TEENS[self]
    elsif self % 10 == 0 && self < 100
      return TENS[self]
    else
      return count(self)
    end
  end


  def check_scale
    scale = nil
    LARGE_SCALES.keys.reverse.each do |key|
      scale ||= key.to_i if self >= key
    end
    scale
  end

  def count(num)
    if num < 100
      less_than_100(num)
    else
      greater_than_100(num)
    end
  end

  def pad_zero(num, pad_count)
    zeros = '0' * pad_count
    "#{num}#{zeros}"
  end

  def less_than_100(num)
    num_string = num.to_s.reverse.chars
    num_counted, pad_count = [], 0

    num_string.each do |n|
      padded = pad_zero(n, pad_count)
      num_counted.unshift(padded.to_i.in_words)
      pad_count += 1
    end

    num_counted.join(' ')
  end

  def greater_than_100(num)
    scale = check_scale
    large_words = "#{(self / scale).in_words} #{LARGE_SCALES[scale]}"

    if num % scale == 0
      return large_words
    else
      return large_words + ' ' + (num % scale).in_words
    end
  end

end
