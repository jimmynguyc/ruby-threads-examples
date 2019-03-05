count = 0
def random_wait(name, count)
  sleep_time = rand(0)/10.0
  sleep(sleep_time)
  "#{name}: Execution order #{count}"
end

values = (1..20).map do |n|
  Thread.new {
    count += 1
    random_wait("Thread #{n}", count)
  }
end.map(&:value)

puts values