require "paint"

class Art

  # def decor
  #   puts ""
  #   puts "         .:.      .:.         .:."
  #   puts "       _oOoOo   _oOoOo       oOoOo_"
  #   puts "      [_|||||  [_|||||       |||||_]".colorize(:light_yellow)
  #   puts "        |||||    |||||       |||||".colorize(:light_yellow)
  #   puts "        ~~~~~    ~~~~~       ~~~~~"
  # end

  def decor
    puts ""
    puts "         .:.      .:.         .:."
    puts "       _oOoOo   _oOoOo       oOoOo_"
    print "      [_"
    print "|||||".colorize(:light_yellow)
    print "  [_"
    print "|||||       |||||".colorize(:light_yellow)
    puts "_]"
    puts "        |||||    |||||       |||||".colorize(:light_yellow)
    puts "        ~~~~~    ~~~~~       ~~~~~"
  end

end

# original art
#        .:.      .:.         .:.
#      _oOoOo   _oOoOo       oOoOo_
#     [_|||||  [_|||||       |||||_]
#       |||||    |||||       |||||
# jgs   ~~~~~    ~~~~~       ~~~~~
