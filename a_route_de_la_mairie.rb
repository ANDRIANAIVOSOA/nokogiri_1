
require 'nokogiri'
require 'open-uri'

# collecte les mail
def get_the_email_of_a_townhal_from_its_webpage(url)
  doc = Nokogiri::HTML(open(url))
  return doc.css('.tr-last')[3].text.split(" ")[2]
end

# collecte les urls
def get_all_the_urls_of_val_doise_townhalls
  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  lien = []
  doc.css('.lientxt').each do |val|	 
    mail = val["href"][1..-1]
    link = "http://annuaire-des-mairies.com" + mail
    lien << link 

  end
  return lien

end 

# take the name of the country
def nom_ville
  nomvilletab = []
  doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  doc.css('.lientxt').each do |val|
    nomville = val.text
    nomvilletab << nomville
  end
  return nomvilletab 
end

# à l'affichage
def recoller
  i = 0
  get_all_the_urls_of_val_doise_townhalls.each do |url|	
  	puts "Ville : "+nom_ville[i]
    puts "Mail : " + get_the_email_of_a_townhal_from_its_webpage(url).to_s
    puts "Son url : " + url.to_s
    puts "*****"
    i += 1
  end
end

# 
def vill_email
  tabhas = []
  i = 0
  get_all_the_urls_of_val_doise_townhalls.each do |url|	
    tabhas.push({
      :name => nom_ville[i],
      :email => get_the_email_of_a_townhal_from_its_webpage(url)
    })
    puts tabhas
    i += 1
  end
end

#appel
#recoller
vill_email


