# CLI Controller
require 'pry'

class BeerSnob::CLI

  def call
    greeting
    list_family_styles
    top_menu
    esc
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
    
    while input != "esc"
      puts "\nEnter the number of the beer family style you'd like to learn more about."
      puts "Type 'list' to display the beer family styles or type 'esc'."
      input = gets.strip

      if input.to_i > 0
        @family = @family_styles[input.to_i - 1]
        puts "\n#{@family.chomp("s")} Beer Styles"
        list_beer_styles
        # this output will be a list of the beer styles under that family
      elsif input == "list"
        list_family_styles
      else
        # put else statement here for wrong input
        # display app instructions (a la "help")
      end
    end

  end

  def list_beer_styles
    @beer_styles = BeerSnob::Scraper.new.scrape
    @beer_styles.each.with_index(1) do |beer, i|
      if beer[:family_style] == @family
        puts "#{i}. #{beer[:style_name]}"
      end
    end
    sub_menu
    # TODO: fix numbering for this list
  end

  # Readdress this method -- pry above method to find insertion point
  def sub_menu
    input = nil
    
    while input != "esc"
      puts "\nEnter the number of the beer style you'd like to learn more about."
      puts "Type 'list' to display the beer styles, type 'back' to choose a different family style, or type 'esc'."
      input = gets.strip
      
      if input.to_i > 0
        family = @family_styles[input.to_i - 1]
        puts "#{family}"
        # this output will be a list of the beer styles under that family
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
  end

  def esc
    puts "\nLast call!"
  end

end