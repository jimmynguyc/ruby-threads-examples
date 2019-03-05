require 'net/http'
require 'benchmark'

pages = %w( www.rubycentral.org
            www.google.com
            www.pragmaticprogrammer.com
           )

threads = []

Benchmark.bm(14) do |bm|
  bm.report("threaded: ") {
    for page in pages
      threads << Thread.new(page) { |myPage|

        h = Net::HTTP.new(page, 80)
        resp, data = h.get('/', nil )
      }
    end

    threads.each { |aThread|  aThread.join }
  }

  bm.report("non-threaded: ") {
    for page in pages
      h = Net::HTTP.new(page, 80)
      resp, data = h.get('/', nil )
    end
  }
end