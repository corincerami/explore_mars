module ExploreMars
  class Photo
    attr_reader :src, :sol, :camera

    def initialize(src, sol, camera)
      @src = src
      @sol = sol
      @camera = camera
    end

    def to_s
      @src
    end
  end
end
