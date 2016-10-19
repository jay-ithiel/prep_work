class Book
  attr_accessor :title

  SMALL_WORDS = ['a', 'an', 'and', 'but', 'the', 'in', 'it', 'for', 'of', 'or', 'on', 'at', 'to', 'from', 'by']

  def title=(title)
    title_filtered = title.split.map.with_index do |word, i|
      if SMALL_WORDS.include?(word.downcase) && i != 0
        word = word.downcase
      else
        word = word.capitalize
      end
    end

    @title = title_filtered.join(' ')
  end
end
