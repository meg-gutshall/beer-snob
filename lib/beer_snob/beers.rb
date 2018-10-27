class Beers
  attr_accessor :family_name, :style_name, :description, :commercial_examples, :beer_name, :brewery

  @@all = []

  def initialize(beers_hash)
    beers_hash.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
    @@all << self
  end

  def self.create_from_scrape(beers_array)
    beers_array.map do |beers_hash|
      new(beers_hash)
    end
  end

  def self.all
    @@all
  end

end