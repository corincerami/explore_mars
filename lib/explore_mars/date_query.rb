module ExploreMars
  class DateQuery < Call
    include Queryable

    def initialize(rover, date, camera=nil)
      @timescale = date
      @camera = camera.to_s.upcase
      @rover = rover
    end

    def date
      timescale
    end
  end
end
