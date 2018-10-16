require 'nokogiri'
require 'open-uri'
require 'pry'


def scrape
  beer_info = []
  commercial_example = {}
  a_to_z = {}

  site = Nokogiri::HTML(open("https://www.craftbeer.com/beer/beer-styles-guide"))
  
  site.css("#content .style").each do |beer_site|
    each_beer = {
      :style_family => beer_site.css(".family-name").text,
      :style_name => beer_site.css(".style-name").text,
      :style_description => beer_site.css("p")[1].text,
      :commercial_example => [],
      :a_to_z => []
    }

    # iterate through commercial examples
    beer_site.css(".winners li").each do |example|
      commercial_example = {
        :brewery => example.css(".brewery").text,
        :beer_name => example.css(".value").text
      }
      each_beer[:commercial_example] << commercial_example
    end

    # iterate through food pairings
    beer_site.css(".simple li").each do |trait|
      a_to_z = {
        :alcohol => trait.css(".value").text,
        :carbonation => trait.css(".value").text,
        :clarity => trait.css(".value").text,
        :process => trait.css(".value").text,
        :color => trait.css(".value").text,
        :origin => trait.css(".value").text,
        :cheese => trait.css(".value").text,
        :entree => trait.css(".value").text,
        :dessert => trait.css(".value").text
      }
      each_beer[:a_to_z] << a_to_z
    end

    # array = beer_site.css(".simple li")
    # :alcohol => array[0]
    # :carbonation => array[1]...


  beer_info << each_beer
  end

  
  binding.pry
  site.css("#content .style").css(".winners .value").first.text

end

scrape

# Let's test some commits!!