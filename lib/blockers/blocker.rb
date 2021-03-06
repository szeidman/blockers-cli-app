class Blockers::Blocker

  attr_accessor :name, :url, :price

  @@all = []

  def self.all
    @@all
  end

  def self.delete
    @@all.clear
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

  def name
    @name
  end

  def self.scrape
    doc = Nokogiri::HTML(open('http://www.goaliemonkey.com/equipment/blockers/sr-goalie-blockers/sort-by/price/sort-direction/asc.html'))
    doc.css("li.item.span3").each do |item|
      name = item.css("div.caption h2.product-name a").text.gsub("Goalie Blocker", "")
      url = item.css("div.caption h2.product-name a").attribute("href").value
      price = item.css("div.price-box p.regular-price span.regular-price span.price").text
      self.new(name, url, price)
    end
  end
end
