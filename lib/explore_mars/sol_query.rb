module ExploreMars
  class SolQuery < Call
    attr_accessor :sol, :camera

    def initialize(sol, camera=nil)
      @sol = sol
      @camera = camera.to_s.upcase
    end

    def build_uri
      if !@camera.empty?
        URI.parse(BASE_URI + "sol=#{@sol}&camera=#{@camera}")
      else
        URI.parse(BASE_URI + "sol=#{@sol}")
      end
    end
  end
end
