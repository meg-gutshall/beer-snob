# CLI Controller
require 'pry'

class BeerSnob::CLI

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
    @beer_styles = BeerSnob::Scraper.scrape
    puts "\n#{@family.chomp("s")} Beer Styles"
    @beer_styles.each.with_index(1) do |beer, i|
      if beer["Family Style"] == @family
        puts "#{i}. #{beer["Style Name"]}"
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
        puts "\n#{beer["Style Name"]}"
        puts "Style Family: #{beer["Family Style"]}"
        puts "\nDescription"
        puts "#{beer["Style Description"]}"
        puts "\nU.S. Commercial Examples"
        puts "#{beer["Commercial Examples"][0]["Beer Name"]} by #{beer["Commercial Examples"][0]["Brewery"]}"
        puts "#{beer["Commercial Examples"][1]["Beer Name"]} by #{beer["Commercial Examples"][1]["Brewery"]}"
        puts "#{beer["Commercial Examples"][2]["Beer Name"]} by #{beer["Commercial Examples"][2]["Brewery"]}"
        puts "\nStyle A-Z"
        puts "Alcohol: #{beer["alcohol"]}"
        puts "Clarity: #{beer["Clarity"]}"
        puts "Brewing Condition/Process: #{beer["Brewing Condition/Process"]}" unless beer["Brewing Condition/Process"] == nil
        puts "Color: #{beer["Color"]}"
        puts "Country: #{beer["Country of Origin"]}"
        puts "Hop Aroma/Flavor: #{beer["Hop Aroma/Flavor"]}"
        puts "Common Hop Ingredients: #{beer["Common Hop Ingredients"]}"
        puts "Malt Aroma/Flavor: #{beer["Malt Aroma/Flavor"]}"
        puts "Common Malt Ingredients: #{beer["Common Malt Ingredients"]}"
        puts "\nFood Pairings"
        puts "Cheese: #{beer["Cheese"]}"
        puts "Entrée: #{beer["Entrée"]}"
        puts "Dessert: #{beer["Dessert"]}"
        
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