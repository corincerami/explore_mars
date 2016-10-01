module ExploreMars
  class Call
    CAMERAS = ["FHAZ", "RHAZ", "MAST", "CHEMCAM", "NAVCAM", "MAHLI", "MARDI", "PANCAM", "MINITES"]

    def get
      check_cameras(@camera)
      uri = build_uri
      response = Net::HTTP.get(uri)
      photos = JSON.parse(response)["photos"]
      photos.map { |photo|
        ExploreMars::Photo.new(photo["img_src"], photo["sol"],
                               photo["camera"]["name"], photo["earth_date"],
                               @rover)
      }
    end

    private

    def check_cameras(camera)
      if !camera.empty? && !CAMERAS.include?(camera.upcase)
        fail "Camera argument must be one of #{CAMERAS.join(', ')}"
      end
    end
  end
end
