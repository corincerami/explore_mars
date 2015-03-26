require "uri"
require "net/http"
require "json"

class ExploreMars
  def self.help
    puts "- use ExploreMars::Call#get(sol, camera) to receive a collection of photos"
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

  def self.get(sol, camera)
    Call.get(sol, camera)
  end
end

require "./lib/explore_mars/call"
require "./lib/explore_mars/photo"
