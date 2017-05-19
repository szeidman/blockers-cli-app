require 'pry'

Class Blockers::Scraper

  def self.scrape_blocker_type_page
    page = Nokogiri::HTML(open('http://www.goaliemonkey.com/equipment/blockers.html'))
    # iterate over div.category-thums.span3
    # Blocker Category: (div.category-thums.span3 a p.name).text
    # Blocker Category URL: (div.category-thums.span3 a).attribute("href").value
    # Category URL should return as category_url
    categories = []
    page.css("div.category-thums.span").each do |category|
      categories << {
        name: category.css("div.category-thums.span3 a p.name").text
        category_url: category.css("div.category-thums.span3 a").attribute("href").value}
    end
    categories
    binding.pry
  end

  def self.scrape_blockers_of_type_page(category_url)
    # Add show/all.html to category_url
    all_category_url = category_url.gsub(".html", "/show/all.html")
    selection = Nokogiri::HTML(open(all_category_url))
    # iterate over the li.item.span3 (note that there is a li.first.item out there...)
    #Blocker name   div.caption h2.product-name a .text
    #Blocker price   div.price-line
    #Blocker URL   div.caption h2.product-name a 'href' .value

end

self.scrape_blocker_type_page
