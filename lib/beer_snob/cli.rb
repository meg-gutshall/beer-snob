# CLI Controller
require 'pry'


class CLI

  def call
    @beer_info = Beers.create_from_scrape(Scraper.scrape)
    greeting
    list_family_styles
    top_menu
  end

  def greeting
    puts "\nTap in to BeerSnob!"
  end

  def list_family_styles
    puts "\nFamily Styles".colorize(:light_magenta)
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
      puts "\nEnter the number of the family style you'd like to learn more about."
      print "\nType "
      print "'families'".colorize(:light_green)
      print " to display the list of family styles again or type "
      print "'exit'".colorize(:light_green)
      puts " to quit."
      input = gets.strip

      if input.to_i > 0 && input.to_i < 16
        @family = @family_styles[input.to_i - 1]
        list_beer_styles
        sub_menu
        # this output is a list of the beer styles under that family
      elsif input.downcase == "families"
        list_family_styles
      elsif input.downcase == "exit"
        exit
      else
        puts "\nYou're flagged!".colorize(:light_red)
      end
    end
  end

  def list_beer_styles
    puts "\n#{@family}".colorize(:light_magenta)
    @beer_styles = []
    @count = 0
    @beer_info.each do |beer|
      if beer.family_name == @family
        @beer_styles << beer
        @count += 1
        puts "#{@count}. #{beer.style_name}"
      end
    end
  end

  def sub_menu
    input = nil
    
    puts "\nEnter the number of the beer style you'd like to learn more about."
    while input != "exit"
      print "\nType "
      print "'styles'".colorize(:light_green)
      print " to display the list of beer styles again, type "
      print "'families'".colorize(:light_green)
      print " to display the list of family styles again or type "
      print "'exit'".colorize(:light_green)
      puts " to quit."
      input = gets.strip
      
      if input.to_i > 0 && input.to_i <= @count
        beer = @beer_styles[input.to_i - 1]
        print "\nStyle Name:".colorize(:light_magenta)
        puts " #{beer.style_name}"
        print "Style Family:".colorize(:light_magenta)
        puts " #{beer.family_name}"
        puts "\nDescription:".colorize(:light_magenta)
        puts "#{beer.description}"
        puts "\nU.S. Commercial Examples:".colorize(:light_magenta)
        puts "#{beer.commercial_examples[0][:beer_name]} by #{beer.commercial_examples[0][:brewery]}"
        puts "#{beer.commercial_examples[1][:beer_name]} by #{beer.commercial_examples[1][:brewery]}"
        puts "#{beer.commercial_examples[2][:beer_name]} by #{beer.commercial_examples[2][:brewery]}"
        # this output is the beer style characteristics
      elsif input.downcase == "styles"
        list_beer_styles
        puts "\nEnter the number of the beer style you'd like to learn more about."
      elsif input.downcase == "families"
        list_family_styles
        top_menu
      elsif input.downcase == "exit"
        exit
      else
        puts "\nYou're flagged!".colorize(:light_red)
      end
    end
  end

  def exit
    Art.new.decor
    puts "\nLast call!".colorize(:light_green)
    puts ""
    exit!
  end

end