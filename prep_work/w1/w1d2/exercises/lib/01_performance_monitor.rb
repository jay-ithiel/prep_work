def measure(repeat = 1, &blk)
  start_time = Time.now
  repeat.times { blk.call }
  (Time.now - start_time) / repeat
end
