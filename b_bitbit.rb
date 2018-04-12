require 'open-uri'
require 'nokogiri'

def cours_cryptomonnnaies(page_url)
    doc = Nokogiri::HTML(open(page_url))
    cours = []
    el_tab = doc.css("#currencies-all tbody tr")
    for i in 0...el_tab.length do
        x = doc.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ")
        cours.push({
            :name => x[2],
            :symbol => x[3],
            :market_cap => x[4],
            :price => x[5],
            :circulating_supply => x[6],
            :volume => x[7],
            :percent_1_h => x[8],
            :percent_24_h => x[9],
            :percent_7_d =>x[10]
        })
    end
    cours
end

puts "Soit patient en attendant l'execution du code! ;)"
# boucle par heure :) 
while 0==0
  puts cours_cryptomonnnaies("https://coinmarketcap.com/all/views/all/")
  sleep 3600 # 3600second = 1heure
end
