require 'pry'
require 'nokogiri'
require 'open-uri'

class Blocker

  attr_accessor :name :url :price

  @@all = []

  def initialize
  end


  def self.scraper_main
    doc = Nokogiri::HTML(open('http://www.goaliemonkey.com/equipment/blockers/sr-goalie-blockers.html'))
    doc.css("li.item.span3").each do |item|
      product = self.new
      product.name = item.css("div.caption h2.product-name a").text
      product.price = item.css("span.regular-price span.price").text
      product.product_url = item("div.caption h2.product-name a").attribute("href").value
    end
  end



end
