require 'net/http'

pages = %w( www.rubycentral.org
            www.google.com
            www.pragmaticprogrammer.com
           )

threads = []

for page in pages
  threads << Thread.new(page) { |myPage|

    h = Net::HTTP.new(myPage, 80)
    puts "Fetching: #{myPage}"
    resp, data = h.get('/', nil )
    puts "Got #{myPage}:  #{resp.message}"
  }
end

sleep 2
# threads.each { |aThread|  aThread.join }