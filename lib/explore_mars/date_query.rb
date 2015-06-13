module ExploreMars
  class DateQuery < Call
    attr_accessor :date, :camera, :rover

    def initialize(rover, date, camera=nil)
      @date = date
      @camera = camera.to_s.upcase
      @rover = rover
    end

    def build_uri
      if !@camera.empty?
        URI.parse(BASE_URI + "#{@rover}/" + "photos?earth_date=#{@date}&camera=#{@camera}")
      else
        URI.parse(BASE_URI + "#{@rover}/" + "photos?earth_date=#{@date}")
      end
    end
  end
end
