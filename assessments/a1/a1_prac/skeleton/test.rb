def try(s = nil)#(&prc)
  s ||= 'hello'
  # if block_given?
  #   yield '2', '3'
  # end
end

# try { |a, b| puts "#{a} #{b}"}
p try
