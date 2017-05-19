require 'pry'
require 'nokogiri'
require 'open-uri'


class Scraper

  def self.scrape_blocker_type_page
    page = Nokogiri::HTML(open('http://www.goaliemonkey.com/equipment/blockers.html'))
    # iterate over div.category-thums.span3
    # Blocker Category: (div.category-thums.span3 a p.name).text
    # Blocker Category URL: (div.category-thums.span3 a).attribute("href").value
    # Category URL should return as category_url
    categories = []
    page.css("div.category-thums.span3").each do |category|
      categories << {
        name: category.css("a p.name").text,
        category_url: category.css("a").attribute("href").value
      }
    end
    categories
  end

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

Scraper.scrape_blockers_of_type_page('http://www.goaliemonkey.com/equipment/blockers/sr-goalie-blockers.html')
