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
    puts "- use ExploreMars#get_by_sol(rover: <ROVER>, sol: <SOL>, camera: <CAMERA>) to receive a collection of photos by sol"
    puts "- use ExploreMars#get_by_date(rover: <ROVER>, date: <DATE>, camera: <CAMERA>) to receive a collection of photos by Earth date"
    puts "-- rover argument should be the name of one of NASA's Mars rovers"
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

  def self.get_by_sol(params)
    fail "Rover and Sol are required" if (params[:rover].blank? || params[:sol].blank?)
    SolQuery.new(params[:rover], params[:sol], params[:camera]).get
  end

  def self.get_by_date(params)
    fail "Rover and Date are required" if (params[:rover].blank? || params[:date].blank?)
    DateQuery.new(params[:rover], params[:date], params[:camera]).get
  end
end
