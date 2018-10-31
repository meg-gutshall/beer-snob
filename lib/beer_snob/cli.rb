# CLI Controller

class CLI

  def learn
    Beers.create_from_scrape(Scraper.scrape)
    greeting
    list_style_families
    top_menu
  end

  def greeting
    puts "\nTap in to BeerSnob!".colorize(:light_green)
  end

  def list_style_families
    puts "\nBeer Style Families".colorize(:light_magenta)
    Beers.all_family_names.each.with_index(1) {|family_name, i| puts "#{i}. #{family_name}"}
  end

  def top_menu
    input = nil
    
    while input != "exit"
      puts "\nEnter the number of the family style you'd like to learn more about."
      puts "\nType " + "'families'".colorize(:light_green) + " to display the list of style families again or type " + "'exit'".colorize(:light_green) + " to quit."
      input = gets.strip

      if input.to_i > 0 && input.to_i < 16
        list_beer_styles(Beers.find_by_family_name(Beers.all_family_names[input.to_i - 1]))
        sub_menu(Beers.find_by_family_name(Beers.all_family_names[input.to_i - 1]))
        # this output is a list of the beer styles under that family
      elsif input.downcase == "families"
        list_family_styles
      elsif input.downcase == "exit"
        exit
      else
        puts "\nYou're flagged! Stop drinking!".colorize(:light_red)
      end
    end
  end

  def list_beer_styles(family)
    puts "\n#{family.first.family_name}".colorize(:light_magenta)
    family.each.with_index(1) {|beer, i| puts "#{i}. #{beer.style_name}"}
  end

  def sub_menu(beers)
    input = nil
    
    puts "\nEnter the number of the beer style you'd like to learn more about."
    while input != "exit"
      puts "\nType " + "'styles'".colorize(:light_green) + " to display the list of beer styles again, type " + "'families'".colorize(:light_green) + " to display the list of style families again or type " + "'exit'".colorize(:light_green) + " to quit."
      input = gets.strip
      
      if input.to_i > 0 && input.to_i <= beers.count
        beer = beers[input.to_i - 1]
        puts "\nStyle Name:".colorize(:light_magenta) + " #{beer.style_name}"
        puts "Style Family:".colorize(:light_magenta) + " #{beer.family_name}"
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
        list_style_families
        top_menu
      elsif input.downcase == "exit"
        exit
      else
        puts "\nYou're flagged! Stop drinking!".colorize(:light_red)
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