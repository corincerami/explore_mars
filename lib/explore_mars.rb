# external dependencies
require "uri"
require "net/http"
require "json"
require 'active_support/time'

# internal dependencies
require "explore_mars/version"
require "explore_mars/call"
require "explore_mars/photo"

module ExploreMars
  def self.help
    puts "- use ExploreMars#get(sol, camera) to receive a collection of photos"
    puts "-- sol argument should be a number representing the Martian day on which the photo was taken"
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

  def self.get(sol, camera=nil)
    Call.new(sol, camera).get
  end
end
