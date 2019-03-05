count = 0
arr = []
10.times do |i|
  arr[i] = Thread.new(i) { |n|
    sleep(rand(0)/10.0)
    Thread.current["mycount"] = count
    Thread.current["name"] = n
    count += 1
  }
end
arr.each {|t| puts t.join.value; print t["mycount"], "(", t["name"], "), " }
puts "count = #{count}"