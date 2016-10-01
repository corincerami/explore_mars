module ExploreMars
  class SolQuery < Call
    include Queryable

    def initialize(rover, sol, camera=nil)
      @timescale = sol
      @camera = camera.to_s.upcase
      @rover = rover
    end

    def sol
      timescale
    end
  end
end
