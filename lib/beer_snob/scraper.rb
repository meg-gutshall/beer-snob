require "nokogiri"
require "open-uri"
require 'pry'

class Scraper
  @@beer_info = []
  @@site = Nokogiri::HTML(open("https://www.craftbeer.com/beer/beer-styles-guide"))

  def self.scrape
    commercial_example = {}

    @@site.css("#content .style").each do |beer_site|
      a_to_z = beer_site.css(".simple li")
      each_beer = {
        :family_name => beer_site.css(".family-name").text.gsub("Style Family: ", ""),
        :style_name => beer_site.css(".style-name").text,
        :description => beer_site.css("p")[1].text,
        :commercial_examples => []
      }
      
      # iterate through commercial examples
      beer_site.css(".winners li").each do |example|
        commercial_example = {
          :beer_name => example.css(".brewery").text,
          :brewery => example.css(".value a").text
        }
        each_beer[:commercial_examples] << commercial_example
      end
  
      
    @@beer_info << each_beer
    end
    @@beer_info
  end

  def self.family_styles
    family_styles = []
    scrape.map do |family|
      family_styles << family[:family_name]
    end
    family_styles.uniq!
  end

end

  # scrape A-to-Z guide info
  # a_to_z_guide = {
  #   :alcohol => site.css("#content .entry-content ul")[6].text,
  #   :carbonation => site.css("#content .entry-content ul")[8].text,
  #   :clarity => site.css("#content .entry-content ul")[9].text,
  #   :color => site.css("#content .entry-content ul")[10].text,
  #   :country => site.css("#content .entry-content ul")[11].text,
  #   :glass => site.css("#content .entry-content ul")[13].text,
  #   :hop_ingredient => site.css("#content .entry-content ul")[14].text,
  #   :malt_ingredient => site.css("#content .entry-content ul")[15].text
  # }
  # TODO: iterate over element
