require "nokogiri"
require "open-uri"
require 'pry'

class BeerSnob::Scraper
  attr_accessor :family_style, :style_name, :style_description

  def scrape
    beer_info = []
    commercial_example = {}
  
    site = Nokogiri::HTML(open("https://www.craftbeer.com/beer/beer-styles-guide"))
    
    site.css("#content .style").each do |beer_site|
      a_to_z = beer_site.css(".simple li .value")
      each_beer = {
        :family_style => beer_site.css(".family-name").text.gsub("Style Family: ", ""),
        :style_name => beer_site.css(".style-name").text,
        :style_description => beer_site.css("p")[1].text,
        :commercial_example => [],
        :alcohol => beer_site.css(".simple li")[11].text,
        :clarity => a_to_z[12].text,
        :color => a_to_z[13].text,
        :country => a_to_z[14].text,
        :cheese => a_to_z[15].text,
        :entree => a_to_z[16].text,
        :dessert => a_to_z[17].text,
        :glass => a_to_z[18].text,
        :hop_flavor => a_to_z[19].text,
        :hop_ingredient => a_to_z[20].text,
        :malt_flavor => a_to_z[21].text,
        :malt_ingredient => a_to_z[22].text
      }
  
      # iterate through commercial examples
      beer_site.css(".winners li").each do |example|
        commercial_example = {
          :beer_name => example.css(".brewery").text,
          :brewery => example.css(".value a").text
        }
        each_beer[:commercial_example] << commercial_example
      end
  
    beer_info << each_beer
    end
    beer_info
  end

  def self.family_styles
    family_styles = []
    beer_info = new.scrape
    beer_info.map do |family|
      family_styles << family[:family_style]
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
