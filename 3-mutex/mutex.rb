mutex = Mutex.new
count1 = count2 = 0
counter = Thread.new do
  loop do
    mutex.synchronize {
      count1 += 1
      count2 += 1
    }
  end
end


sleep 1
mutex.synchronize {
  puts count1
  puts count2
}
