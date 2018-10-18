# CLI Controller

class BeerSnob::CLI

  def call
    puts "Tap in to BeerSnob!"
    list_style_families
    top_menu
    sub_menu
  end

  def list_style_families
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
    print "Enter the number of the style family you'd like to learn more about: "
  end

  def sub_menu
    print "Enter the number of the beer style you'd like to learn more about: "
  end

end