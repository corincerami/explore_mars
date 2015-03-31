module ExploreMars
  class Call
    CAMERAS = ["FHAZ", "RHAZ", "MAST", "CHEMCAM", "NAVCAM", "MAHLI", "MARDI"]
    attr_reader :sol, :camera

    def initialize(sol, camera=nil)
      @sol = sol
      @camera = camera.to_s.upcase
    end

    def get
      check_cameras(@camera)
      uri = build_uri
      response = Net::HTTP.get(uri)
      photos = JSON.parse(response)
      photos.map { |photo|
        ExploreMars::Photo.new(photo["img_src"], photo["sol"], photo["camera"])
      }
    end

    private

    def build_uri
      if !@camera.empty?
        URI.parse("https://mars-curiosity-api.herokuapp.com/photos.json?sol=#{@sol}&camera=#{@camera}")
      else
        URI.parse("https://mars-curiosity-api.herokuapp.com/photos.json?sol=#{@sol}")
      end
    end

    def check_cameras(camera)
      if !camera.empty? && !CAMERAS.include?(camera.upcase)
        raise "Camera argument must be one of #{CAMERAS.join(', ')}"
      end
    end
  end
end
