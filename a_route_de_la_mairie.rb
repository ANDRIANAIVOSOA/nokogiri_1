#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

# Fetch and parse HTML document

def get_the_email_of_a_townhal_from_its_webpage 
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))
	return doc.css('.tr-last')[3].text.split(" ")[2]
end

def get_all_the_urls_of_val_doise_townhalls
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	doc.css('.lientxt').each do |val|
		 puts val["href"]
	end
end 


puts get_the_email_of_a_townhal_from_its_webpage