module ExploreMars
  class Call
    CAMERAS = ["FHAZ", "RHAZ", "MAST", "CHEMCAM", "NAVCAM", "MAHLI", "MARDI"]
    attr_reader :sol, :camera

    def initialize(sol, camera=nil)
      @sol = sol
      @camera = camera
    end

    def get
      check_cameras(@camera)
      uri = URI.parse("https://mars-curiosity-api.herokuapp.com/photos.json?sol=#{@sol}&camera=#{@camera.upcase}")
      response = Net::HTTP.get(uri)
      photos = JSON.parse(response)
      photos.map { |photo|
        ExploreMars::Photo.new(photo["img_src"], photo["sol"], photo["camera"])
      }
    end

    private

    def check_cameras(camera)
      if !camera.nil? && !CAMERAS.include?(camera.upcase)
        raise "Camera argument must be one of #{CAMERAS.join(', ')}"
      end
    end
  end
end
