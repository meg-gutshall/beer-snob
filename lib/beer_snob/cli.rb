# CLI Controller
require 'pry'

class BeerSnob::CLI

  def call
    greeting
    list_style_families
    top_menu
    # sub_menu
    exit
  end

  def greeting
    puts "\nTap in to BeerSnob!"
  end

  def list_style_families
    puts "\n"
    puts <<-DOC
      Beer Style Families
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
  end

  def top_menu
    input = nil
    
    while input != "exit"
      puts "\nEnter the number of the style family you'd like to learn more about or type exit to quit."
      input = gets.strip
      
      case input
      when "1"
        puts "\nMore info on Pale Ales..."
      when "2"
        puts "\nMore info on Dark Lagers..."
      when "3"
        puts "\nMore info on Brown Ales..."
      # until all style families are accounted for
      # this output will be a short description of the beer style family (?) 
      # and a list of the beer styles under that family
      when "list"
        list_style_families
      else
        # put else statement here
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
        list_style_families
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