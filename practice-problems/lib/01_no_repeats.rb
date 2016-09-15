def no_repeats(year_start, year_end)
  no_repeat_years = []

  (year_start..year_end).each do |year|
    no_repeat_years << year if !repeat?(year)
  end

  no_repeat_years
end

def repeat?(year)
  year = year.to_s.chars
  year.uniq.each { |char| return true if year.count(char) > 1 }
  false
end
