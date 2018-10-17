require 'nokogiri'
require 'open-uri'
require 'pry'


def scrape
  beer_info = []
  commercial_example = {}
  

  site = Nokogiri::HTML(open("https://www.craftbeer.com/beer/beer-styles-guide"))
  
  site.css("#content .style").each do |beer_site|
    a_to_z = beer_site.css(".simple li .value")
    each_beer = {
      :style_family => beer_site.css(".family-name").text,
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
        :brewery => example.css(".brewery").text,
        :beer_name => example.css(".value").text
      }
      each_beer[:commercial_example] << commercial_example
    end


  beer_info << each_beer
  end

  
  binding.pry


end

scrape

# Let's test some commits!!