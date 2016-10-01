module ExploreMars
  module Queryable
    attr_reader :timescale, :camera, :rover

    BASE_URI = "https://mars-photos.herokuapp.com/api/v1/rovers/"

    def build_uri
      if !camera.empty?
        URI.parse(BASE_URI + "#{rover}/" + "photos?sol=#{timescale}&camera=#{camera}")
      else
        URI.parse(BASE_URI + "#{rover}/" + "photos?sol=#{timescale}")
      end
    end
  end
end
