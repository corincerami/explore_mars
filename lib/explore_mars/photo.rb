module ExploreMars
  class Photo
    require "date"
    attr_reader :src, :sol, :camera, :earth_date

    LANDING_DATE = DateTime.new(2012,8,6,5,17,57)
    SOL_IN_SECONDS = 88775.244

    def initialize(src, sol, camera, earth_date)
      @src = src
      @sol = sol
      @camera = camera
      @earth_date = Date.strptime(earth_date)
    end

    def to_s
      @src
    end
  end
end
