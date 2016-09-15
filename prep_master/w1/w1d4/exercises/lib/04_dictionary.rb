class Dictionary
  attr_reader :entries

  def initialize(entries = {})
    @entries = entries
  end

  def add(entry)
    if entry.is_a?(Hash)
        keyword = entry.keys[0]
        @entries[keyword] = entry[keyword]
    else
        keyword = entry
        @entries[keyword] = nil
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(word)
    @entries.keys.include?(word)
  end

  def find(word)
    valid_word = @entries.keys.select { |keyword| keyword == word }.join('')
    matched_words = @entries.keys.select { |keyword| keyword.match(/#{word}/i) }
    matched_word_definitions = {}

    matched_words.each do |matched_word|
      matched_word_definitions[matched_word] = @entries[matched_word]
    end

    if matched_words.length > 0
      return matched_word_definitions
    elsif valid_word.length == 0
      return valid_word
    else valid_word.length > 0
      return { valid_word => @entries[valid_word] }
    end
  end

  def printable
    self.keywords.map.with_index do |keyword, i|
      line = "[#{keyword}] \"#{@entries[keyword]}\"\n"
      i == self.keywords.length-1 ? line.strip : line
    end.join('')
  end

end
