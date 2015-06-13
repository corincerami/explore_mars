module ExploreMars
  class Photo
    require "date"
    attr_reader :src, :sol, :camera, :earth_date, :rover

    def initialize(src, sol, camera, earth_date, rover)
      @src = src
      @sol = sol
      @camera = camera
      @earth_date = Date.strptime(earth_date)
      @rover = rover
    end

    def to_s
      @src
    end
  end
end
