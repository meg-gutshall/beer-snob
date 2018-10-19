# CLI Controller
require 'pry'

class BeerSnob::CLI

  def call
    greeting
    list_family_styles
    top_menu
    # sub_menu
    exit
  end

  def greeting
    puts "\nTap in to BeerSnob!"
  end

  def list_family_styles
    @family_styles = BeerSnob::Beers.family_styles
  end

  def top_menu
    input = nil
    
    while input != "exit"
      puts "\nEnter the number of the beer family style you'd like to learn more about."
      puts "Type 'list' to display the beer family styles or type 'exit' to quit."
      input = gets.strip

      if input.to_i > 0
        puts @family_styles[input.to_i - 1]
        # this output will be a short description of the beer style family (?) 
        # and a list of the beer styles under that family
      elsif input == "list"
        list_family_styles
      else
        # put else statement here for wrong input
        # display app instructions (a la "help")
      end
    end

  end

  # Readdress this method -- pry above method to find insertion point
  def sub_menu
    
    while input != "exit"
      puts "\nEnter the number of the beer style you'd like to learn more about or type exit to quit."
      input = gets.strip
      
      case input
      when "1"
        puts "\nMore info..."
      when "2"
        puts "\nMore info..."
      when "3"
        puts "\nMore info..."
      # until all beer styles are accounted for
      # this output will be the scraped data of each beer style
      when "list"
        list_beer_styles   # will have to make this method
      when "back"
        list_family_styles
        top_menu
      else
        # put else statement here
      end
    end
  end

  def exit
    puts "\nLast call!"
  end

end