def letter_count(str)
  count_hash = {}

  mod_str = str.gsub(/[^a-z]/i, "")
  mod_str.chars.sort.uniq.each { |char| count_hash[char] = 0 }

  mod_str.chars.each do |char|
    count_hash[char] += 1
  end

  count_hash
end
