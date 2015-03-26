require "pry"
class ExploreMars::Call
  CAMERAS = ["FHAZ", "RHAZ", "MAST", "CHEMCAM", "NAVCAM", "MAHLI", "MARDI"]

  def self.get(sol, camera)
    if !CAMERAS.include?(camera.upcase)
      raise "camera argument must be one of #{CAMERAS.join(', ')}"
    end
    uri = URI.parse("https://mars-curiosity-api.herokuapp.com/photos.json?sol=#{sol}&camera=#{camera.upcase}")
    response = Net::HTTP.get(uri)
    photos = JSON.parse(response)
    photos.map { |photo|
      Photo.new(photo["img_src"], photo["sol"], photo["camera"])
    }
  end
end
