def reverser(&blk)
  blk.call.split.map { |substr| substr.reverse }.join(' ')
end

def adder(n = 1, &blk)
  blk.call + n
end

def repeater(repeat = 2, &blk)
  repeat.times { blk.call }
end
