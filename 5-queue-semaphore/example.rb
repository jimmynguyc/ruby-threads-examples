mutex = Mutex.new
queue = Queue.new
cv = ConditionVariable.new
a = Thread.new {
  mutex.synchronize {
    queue.enq :start
    puts "A: I have critical section, but will wait for cv"
    cv.wait(mutex)
    puts "A: I have critical section again! I rule!"
  }
}

b = Thread.new {
  mutex.synchronize {
    queue.deq
    puts "B: Now I am critical, but am done with cv"
    cv.signal
    puts "B: I am still critical, finishing up"
  }
}
puts "(Later, back at the ranch...)"

a.join
b.join