module ExploreMars
  class Call
    CAMERAS = ["FHAZ", "RHAZ", "MAST", "CHEMCAM", "NAVCAM", "MAHLI", "MARDI"]
    BASE_URI = "https://mars-curiosity-api.herokuapp.com/api/v1/rovers/"

    def get
      check_cameras(@camera)
      uri = build_uri
      response = Net::HTTP.get(uri)
      photos = JSON.parse(response)["photos"]
      photos.map { |photo|
        ExploreMars::Photo.new(photo["img_src"], photo["sol"],
                               @camera, photo["earth_date"],
                               @rover)
      }
    end

    private

    def check_cameras(camera)
      if !camera.empty? && !CAMERAS.include?(camera.upcase)
        raise "Camera argument must be one of #{CAMERAS.join(', ')}"
      end
    end
  end
end
