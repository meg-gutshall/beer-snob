require 'pry'

class BeerSnob::Beers
  attr_accessor :name, :info, :examples, :alcohol

  def self.family_styles
    family_styles = []
    family_style = BeerSnob::Scraper.new.scrape
    family_style.map do |family|
      family_styles << family[:family_style]
    end
    family_styles.uniq!
  end

  def self.beer_styles
    # returns all beer styles
    
    beer_style_1 = self.new
    beer_style_1.name = "American Amber Ale"
    beer_style_1.info = "Descriptive info..."

    beer_style_2 = self.new
    beer_style_2.name = "American Amber Lager"
    beer_style_2.info = "Descriptive info..."

    beer_style_3 = self.new
    beer_style_3.name = "American Brown Ale"
    beer_style_3.info = "Descriptive info..."

    [beer_style_1, beer_style_2, beer_style_3]

  end

end