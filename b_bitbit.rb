require 'open-uri'
require 'nokogiri'

def cours_cryptomonnnaies(page_url)
    doc = Nokogiri::HTML(open(page_url))
    cours = []
    el_tab = doc.css("#currencies-all tbody tr")
    for i in 0...el_tab.length do
        x = doc.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ")
        cours.push({
            :name => x[1],
            :symbol => x[2],
            :market_cap => x[3],
            :price => x[4],
            :circulating_supply => x[5],
            :volume => x[6],
            :percent_1_h => x[7],
            :percent_24_h => x[8],
            :percent_7_d =>x[9]
        })
        puts cours
    end
    cours
end

puts cours_cryptomonnnaies("https://coinmarketcap.com/all/views/all/")