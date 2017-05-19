Class Blockers::Scraper

  def self.scrape_blocker_type_page
    categories = Nokogiri::HTML(open('http://www.goaliemonkey.com/equipment/blockers.html'))
    # Blocker Category: (div.category-thums.span3 a p.name).text
    # Blocker Category URL: (div.category-thums.span3 a).attribute("href").value
    # Category URL should return as category_url
  end

  def self.scrape_blockers_of_type_page(category_url)
    # Add show/all.html to category_url
    selection = Nokogiri::HTML(open('http://www.goaliemonkey.com/equipment/blockers.html'))
    #Blocker name
    #Blocker price
    #Blocker URL
end
