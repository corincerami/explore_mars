module ExploreMars
  class SolQuery < Call
    attr_accessor :sol, :camera, :rover
    def initialize(rover, sol, camera=nil)
      @sol = sol
      @camera = camera.to_s.upcase
      @rover = rover
    end

    def build_uri
      if !@camera.empty?
        URI.parse(BASE_URI + "#{@rover}/" + "photos?sol=#{@sol}&camera=#{@camera}")
      else
        URI.parse(BASE_URI + "#{@rover}/" + "photos?sol=#{@sol}")
      end
    end
  end
end
