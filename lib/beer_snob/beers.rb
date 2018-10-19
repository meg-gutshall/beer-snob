require 'pry'

class BeerSnob::Beers
  attr_accessor :name, :info, :examples, :alcohol

  def self.family_styles
    puts <<-DOC
    \nBeer Style Families
    1. "Pale Ales"
    2. "Dark Lagers"
    3. "Brown Ales"
    4. "India Pale Ales"
    5. "Wheat Beers"
    6. "Strong Ales"
    7. "Belgian Styles"
    8. "Hybrid Beers"
    9. "Porters"
    10. "Stouts"
    11. "Bocks"
    12. "Scottish-Style Ales"
    13. "Wild/Sour Beers"
    14. "Piseners and Pale Lagers"
    15. "Specialty Beers"
  DOC

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