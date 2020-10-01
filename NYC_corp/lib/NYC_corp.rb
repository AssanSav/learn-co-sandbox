require 'nokogiri'
require 'open-uri'
require "colorize"
require 'pry'


require_relative "./NYC_corp/version"
require_relative "./NYC_corp/scraper"
require_relative "./NYC_corp/company"
require_relative "./NYC_corp/cli"



module NYCCorp
  class Error < StandardError; end
  
end
