mutex = Mutex.new
cv = ConditionVariable.new
a = Thread.new {
  mutex.synchronize {
    puts "A: I have critical section, but will wait for cv"
    cv.wait(mutex)
    puts "A: I have critical section again! I rule!"
  }
}

b = Thread.new {
  mutex.synchronize {
    puts "B: Now I am critical, but am done with cv"
    cv.signal
    puts "B: I am still critical, finishing up"
  }
}
puts "(Later, back at the ranch...)"

a.join
b.join

















# (Later, back at the ranch...)
# B: Now I am critical, but am done with cv
# B: I am still critical, finishing up
# A: I have critical section, but will wait for cv
# Traceback (most recent call last):
#         1: from example.rb:20:in `<main>'
# example.rb:20:in `join': No live threads left. Deadlock? (fatal)
# 2 threads, 2 sleeps current:0x00007ff32dd19e70 main thread:0x00007ff32dc0b7e0
# * #<Thread:0x00007ff32e085c40 sleep_forever>
#    rb_thread_t:0x00007ff32dc0b7e0 native:0x00000001084ee5c0 int:0
#    example.rb:20:in `join'
#    example.rb:20:in `<main>'
# * #<Thread:0x00007ff32e02d4c8@example.rb:3 sleep_forever>
#    rb_thread_t:0x00007ff32dd19e70 native:0x000070000a137000 int:0
#     depended by: tb_thread_id:0x00007ff32dc0b7e0
#    example.rb:6:in `sleep'
#    example.rb:6:in `wait'
#    example.rb:6:in `block (2 levels) in <main>'
#    example.rb:4:in `synchronize'
#    example.rb:4:in `block in <main>'