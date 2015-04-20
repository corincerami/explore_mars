module ExploreMars
  class Photo
    attr_reader :src, :sol, :camera

    LANDING_DATE = DateTime.new(2012,8,6,5,17,57)
    SOL_IN_SECONDS = 88775.244

    def initialize(src, sol, camera)
      @src = src
      @sol = sol
      @camera = camera
    end

    def to_s
      @src
    end

    def earth_date
      date = LANDING_DATE + (@sol.to_i * SOL_IN_SECONDS).seconds
      date.strftime("%b %e, %Y")
    end
  end
end
