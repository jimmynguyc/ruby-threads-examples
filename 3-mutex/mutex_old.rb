# RBENV_VERSION=1.8.7-p375 ruby mutex.rb
count1 = count2 = 0
difference = 0
counter = Thread.new do
  loop do
    count1 += 1
    count2 += 1
  end
end

spy = Thread.new do
  loop do
    difference += (count1 - count2).abs
  end
end

sleep 1
Thread.critical = 1
puts count1
puts count2
puts difference
