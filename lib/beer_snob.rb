# Acts as the environment
# The executable file will require this file and this file requires all 
# other dependencies
require "nokogiri"
require "open-uri"
require "paint"
require "colorize"

require_relative "./beer_snob/version"
require_relative "./beer_snob/cli"
require_relative "./beer_snob/scraper"
require_relative "./beer_snob/beers"
require_relative "./beer_snob/art"