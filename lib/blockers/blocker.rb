require 'pry'
require 'nokogiri'
require 'open-uri'

<<<<<<< HEAD
class Blockers::Blocker
=======
class Blocker
>>>>>>> 7083a02035a23ad61761d9aa3c67499b283ceacb

  attr_accessor :name, :url, :price

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, url, price)
    @name = name
    @url = url
    @price = price
    @@all << self
  end

  def self.find(index)
    self.all[index]
  end


  def self.scrape
    doc = Nokogiri::HTML(open('http://www.goaliemonkey.com/equipment/blockers/sr-goalie-blockers.html'))
    doc.css("li.item.span3").each do |item|
      name = item.css("div.caption h2.product-name a").text
      url = item.css("div.caption h2.product-name a").attribute("href").value
      price = item.css("span.regular-price span.price").text
      self.new(name, url, price)
      binding.pry
    end
  end

end