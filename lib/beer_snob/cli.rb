# CLI Controller
require 'pry'

class CLI

  def call
    Beers.new(Scraper.scrape)
    binding.pry
    greeting
    list_family_styles
    top_menu
  end

  def greeting
    puts "\nTap in to BeerSnob!"
  end

  def list_family_styles
    puts "\nBeer Family Styles"
    Scraper.family_styles.each.with_index(1) do |family_style, i|
      puts "#{i}. #{family_style}"
    end
  end

  def top_menu
    input = nil
    
    while input != "exit"
      puts "\nEnter the number of the beer family style you'd like to learn more about."
      puts "Type 'list' to display the beer family styles or type 'exit'."
      input = gets.strip

      if input.to_i > 0
        @family = Scraper.family_styles[input.to_i - 1]
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
    beer_styles = Scraper.scrape
    puts "\n#{@family.chomp("s")} Beer Styles"
    beer_styles.each.with_index do |beer, i|
      binding.pry
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
        puts "\nStyle Name: #{beer[:style_name]}"
        puts "Style Family: #{beer[:family]}"
        puts "\nDescription"
        puts "#{beer[:description]}"
        puts "\nU.S. Commercial Examples"
        puts "#{beer[:commercial_examples][0][:beer_name]} by #{beer[:commercial_examples][0][:brewery]}"
        puts "#{beer[:commercial_examples][1][:beer_name]} by #{beer[:commercial_examples][1][:brewery]}"
        puts "#{beer[:commercial_examples][2][:beer_name]} by #{beer[:commercial_examples][2][:brewery]}"
        puts "\nStyle A-Z"
        puts "Alcohol: #{beer[:alcohol]}"
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