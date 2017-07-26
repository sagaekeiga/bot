require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://160.16.198.30/bots/togikai"))
puts @crawl = doc.css('body > table:nth-child(345)').inner_html