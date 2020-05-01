def letter_count(str)
  counts = Hash.new(0)

  str.each_char do |char|
    counts[char] += 1 unless char == " "
  end
  counts
end

def my_letter_count(str)
  count = {}
  split_s = str.split('')
  
  split_s.each do |char|
    if !count[char]
      next if char == ' ' 
      count[char] = 1
    else
      count[char] += 1
    end    
  end

  count
end

def my_letter_count2(str)
  count = Hash.new(0)
  
  str.each_char do |letter|
    count[letter] += 1 unless letter == " "
  end
  
  count
end


def my_letter_count3(str)
  count = {}
  
  str.each_char do |letter|
    if letter == " "
      next
    end
    
    if !count[letter]
      count[letter] = 1
    else
      count[letter] += 1
    end
    
  end
  count 
end