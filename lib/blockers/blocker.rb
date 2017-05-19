require 'pry'
require 'nokogiri'
require 'open-uri'

class Blocker

  attr_accessor :category_name :category_url :price :product_name :product_url

  @@all = []

  def initialize
  end


  def self.scraper_main
    doc = Nokogiri::HTML(open('http://www.goaliemonkey.com/equipment/blockers.html'))
    categories = doc.css("div.category-thums.span3")
    categories.each do |category|
      category = self.new
      category.category_name = category.css("a p.name").text
      category.category_url = category.css("a").attribute("href").value
      category.scraper_category
    end
  end

  def scraper_category
    all_category = self.category_url.gsub(".html", "/show/all.html")
    doc = Nokogiri::HTML(open(all_category))
    doc.css("li.item.span3").each do |item|
      item.product_name = select.css("div.caption h2.product-name a").text
      item.price = select.css("span.regular-price span.price").text
      item.product_url = select.css("div.caption h2.product-name a").attribute("href").value
  end

  # def categories_main
  #   self.page.css("div.category-thums.span3")
  # end

  # def categories_scrape
  #   categories_main.each do |category|
  #     name = category.css("a p.name").text,
  #     category_url = category.css("a").attribute("href").value
  #     }
  #   end
  #   categories
  # end

  def self.scrape_blockers_of_type_page(category_url)
    # Add show/all.html to category_url
    all_category_url = category_url.gsub(".html", "/show/all.html")
    selection = Nokogiri::HTML(open(all_category_url))
    # iterate over the li.item.span3 (note that there is a li.first.item out there...)
    #Blocker name   div.caption h2.product-name a .text
    #Blocker price   div.price-line
    #Blocker URL   div.caption h2.product-name a 'href' .value
    items = []
    selection.css("li.item.span3").each do |select|
      items << {name: select.css("div.caption h2.product-name a").text,
      price: select.css("span.regular-price span.price").text, url: select.css("div.caption h2.product-name a").attribute("href").value}
    end
    items
    binding.pry
  end

end
