require_relative '../config/environment'

require_relative "./blockers/blocker"
require_relative "./blockers/cli"
require_relative "./blockers/scraper"

require 'open-uri'
require 'nokogiri'
require 'pry'

module Blockers
end
