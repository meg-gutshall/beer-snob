require 'pry'

class BeerSnob::Beers
  attr_accessor :name, :info, :examples, :alcohol

  def self.style_families

    family_style_1 = self.new
    family_style_1.name = "Pale Ales"

    family_style_2 = self.new
    family_style_2.name = "Dark Lagers"

    family_style_3 = self.new
    family_style_3.name = "Brown Ales"

    [family_style_1, family_style_2, family_style_3]

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