require 'net/http'

pages = %w( www.rubycentral.org
            www.google.com
            www.pragmaticprogrammer.com
           )

for page in pages
  h = Net::HTTP.new(page, 80)
  puts "Fetching: #{page}"
  resp, data = h.get('/', nil )
  puts "Got #{page}:  #{resp.message}"
end
