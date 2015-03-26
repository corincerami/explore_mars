class ExploreMars::Photo
  def self.get(sol, camera)
    uri = URI.parse("https://mars-curiosity-api.herokuapp.com/photos.json?sol=#{sol}&camera=#{camera}")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
