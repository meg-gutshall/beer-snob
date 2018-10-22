# CLI Controller
require 'pry'

class BeerSnob::CLI
  attr_accessor :trigger

  def call
    greeting
    list_family_styles
    top_menu
  end

  def greeting
    puts "\nTap in to BeerSnob!"
  end

  def list_family_styles
    puts "\nBeer Family Styles"
    @family_styles = BeerSnob::Scraper.family_styles
    @family_styles.each.with_index(1) do |family, i|
      puts "#{i}. #{family}"
    end
  end

  def top_menu
    input = nil
    
    while input != "exit"
      puts "\nEnter the number of the beer family style you'd like to learn more about."
      puts "Type 'list' to display the beer family styles or type 'exit'."
      input = gets.strip

      if input.to_i > 0
        @family = @family_styles[input.to_i - 1]
        list_beer_styles
        # this output is a list of the beer styles under that family
      elsif input == "list"
        list_family_styles
      else
        # put else statement here for wrong input
        # display app instructions (a la "help")
      end
    end
    exit
  end

  def list_beer_styles
    @beer_styles = BeerSnob::Scraper.new.scrape
    puts "\n#{@family.chomp("s")} Beer Styles"
    @beer_styles.each.with_index(1) do |beer, i|
      if beer[:family_style] == @family
        puts "#{i}. #{beer[:style_name]}"
      end
    end
    sub_menu
  end

  def sub_menu
    input = nil
    
    while input != "exit"
      puts "\nEnter the number of the beer style you'd like to learn more about."
      puts "Type 'list' to display the beer styles, type 'back' to choose a different family style, or type 'exit'."
      input = gets.strip
      
      if input.to_i > 0
        beer = @beer_styles[input.to_i - 1]
        puts "\n#{beer[:style_name]}"
        puts "Style Family: #{beer[:family_style]}"
        puts "\nDescription"
        puts "#{beer[:style_description]}"
        puts "\nU.S. Commercial Examples"
        puts "#{beer[:commercial_example][0][:beer_name]} by #{beer[:commercial_example][0][:brewery]}"
        puts "#{beer[:commercial_example][1][:beer_name]} by #{beer[:commercial_example][1][:brewery]}"
        puts "#{beer[:commercial_example][2][:beer_name]} by #{beer[:commercial_example][2][:brewery]}"
        puts "\nStyle A-Z"
        puts "Alcohol: #{beer[:alcohol]}"
        puts "Clarity: #{beer[:clarity]}"
        puts "Color: #{beer[:color]}"
        puts "Country: #{beer[:country]}"
        puts "Hop Aroma/Flavor: #{beer[:hop_flavor]}"
        puts "Common Hop Ingredients: #{beer[:hop_ingredient]}"
        puts "Malt Aroma/Flavor: #{beer[:malt_flavor]}"
        puts "Common Malt Ingredients: #{beer[:malt_ingredient]}"
        puts "\nFood Pairings"
        puts "Cheese: #{beer[:cheese]}"
        puts "Entrée: #{beer[:entree]}"
        puts "Dessert: #{beer[:dessert]}"
        
        # this output is the beer style characteristics
      elsif input == "list"
        list_beer_styles
      elsif input == "back"
        list_family_styles
        top_menu
      else
        # put else statement here for wrong input
        # display app instructions (a la "help")
      end
    end
    exit
  end

  def exit
    puts "\nLast call!"
    exit!
  end

end