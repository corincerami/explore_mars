# external dependencies
require "uri"
require "net/http"
require "json"
require 'active_support/time'

# internal dependencies
require "explore_mars/version"
require "explore_mars/call"
require "explore_mars/photo"
require "explore_mars/sol_query"
require "explore_mars/date_query"

module ExploreMars
  def self.help
    puts "- use ExploreMars#get_by_sol(sol, camera) to receive a collection of photos by sol"
    puts "- use ExploreMars#get_by_date(date, camera) to receive a collection of photos by Earth date"
    puts "-- sol argument should be a number representing the Martian day on which the photo was taken"
    puts "-- date argument should be a string formmated as yyyy-mm-dd"
    puts "-- camera represents the camera with which it was taken, options are:"
    puts "--- 'FHAZ' (Front Hazard Avoidance Camera)"
    puts "--- 'RHAZ' (Rear Hazard Avoidance Camera)"
    puts "--- 'MAST' (Mast Camera)"
    puts "--- 'CHEMCAM' (Chemistry and Camera Complex)"
    puts "--- 'NAVCAM' (Navigation Camera)"
    puts "--- 'MAHLI' (Mars Hand Lens Imager)"
    puts "--- 'MARDI' (Mars Descent Imager)"
    puts "- ExploreMars::Photo#src will return the source url for the photo"
  end

  def self.get_by_sol(rover, sol, camera=nil)
    SolQuery.new(rover, sol, camera).get
  end

  def self.get_by_date(rover, date, camera=nil)
    DateQuery.new(rover, date, camera).get
  end
end
