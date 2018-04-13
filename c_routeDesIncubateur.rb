#Méthode pour avoir la liste des urls 
require 'nokogiri'
require 'open-uri'

def list_url(page_url)
	page = Nokogiri::HTML(open(page_url))
	urls = []
	list = page.css("#incubators_list span a")
	list.each do |x|
		urls << "http://www.mon-incubateur.com" + x['href']
	end
	urls
end

#Méthode pour ajouter les détails
def plus_detail(page_url)
	page = Nokogiri::HTML(open(page_url))
	detail = Hash.new(0)
	nom = page.css(".promo-bar h2").text
	code_postal = page.css(".promo-bar strong").text.split("\n").join(" ").split(" ")[0]
	site_web = page.css(".info-block a")[26]['href']
	detail[:nom] = nom
	detail[:code_postal] = code_postal
	detail[:site_web] = site_web
	detail
end

# Methode pour tester le code
def afficher_france_incubateurs
    list = list_url("http://www.mon-incubateur.com/site_incubateur/incubateurs")
    incubateur_fr = []
    list.each do |x|
        incubateur_fr.push(plus_detail(x))
    end
	incubateur_fr.each do |x|
		puts "\n\n***********************************************************************"
		puts x
	end
end
afficher_france_incubateurs