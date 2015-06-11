module ExploreMars
  class DateQuery < Call
    attr_accessor :date, :camera

    def initialize(date, camera=nil)
      @date = date
      @camera = camera.to_s.upcase
    end

    def build_uri
      if !@camera.empty?
        URI.parse(BASE_URI + "earth_date=#{@date}&camera=#{@camera}")
      else
        URI.parse(BASE_URI + "earth_date=#{@date}")
      end
    end
  end
end
