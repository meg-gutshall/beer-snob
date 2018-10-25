# CLI Controller
require 'pry'

class CLI

  def call
    @beer_info = Beers.create_from_scrape(Scraper.scrape)
    # binding.pry
    greeting
    list_family_styles
    top_menu
  end

  def greeting
    puts "\nTap in to BeerSnob!"
  end

  def list_family_styles
    puts "\nBeer Family Styles"
    @family_styles = []
    @beer_info.map do |beer|
      @family_styles << beer.family_name
    end
    @family_styles.uniq!.each.with_index(1) do |family_name, i|
      puts "#{i}. #{family_name}"
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
        sub_menu
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
    puts "\n#{@family.chomp("s")} Beer Styles"
    @beer_info.each.with_index(1) do |beer, i|
      if beer.family_name == @family
        puts "#{i}. #{beer.style_name}"
      end
    end
  end

  def sub_menu
    # binding.pry
    input = nil
    
    while input != "exit"
      puts "\nEnter the number of the beer style you'd like to learn more about."
      puts "Type 'list' to display the beer styles, type 'back' to choose a different family style, or type 'exit'."
      input = gets.strip
      
      if input.to_i > 0
        beer = list_beer_styles[input.to_i - 1]
        puts "\nStyle Name: #{beer[:style_name]}"
        puts "Style Family: #{beer[:family_name]}"
        puts "\nDescription"
        puts "#{beer[:description]}"
        puts "\nU.S. Commercial Examples"
        puts "#{beer[:commercial_examples][0][:beer_name]} by #{beer[:commercial_examples][0][:brewery]}"
        puts "#{beer[:commercial_examples][1][:beer_name]} by #{beer[:commercial_examples][1][:brewery]}"
        puts "#{beer[:commercial_examples][2][:beer_name]} by #{beer[:commercial_examples][2][:brewery]}"
        
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