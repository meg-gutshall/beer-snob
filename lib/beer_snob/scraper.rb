class Scraper

  def self.scrape
    beer_info = []
    site = Nokogiri::HTML(open("https://www.craftbeer.com/beer/beer-styles-guide"))
    commercial_example = {}

    site.css("#content .style").each do |beer_site|
      a_to_z = beer_site.css(".simple li")
      each_beer = {
        :family_name => beer_site.css(".family-name").text.gsub("Style Family: ", ""),
        :style_name => beer_site.css(".style-name").text,
        :description => beer_site.css("p").map(&:text).keep_if{|d| !d.match(/(Style Family)|(\bour\b)|(CraftBeer.com)|(newsletter)/)}.join("\n\n"),
        :commercial_examples => []
      }
      
      # iterate through commercial examples
      beer_site.css(".winners li").each do |example|
        commercial_example = {
          :beer_name => example.css(".brewery").text.strip,
          :brewery => example.css(".value a").text
        }
        each_beer[:commercial_examples] << commercial_example
      end
  
    beer_info << each_beer
    end
    beer_info
  end

end
