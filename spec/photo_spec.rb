require "spec_helper"

describe ExploreMars::Photo do
  describe "attributes" do
    let(:photo) { ExploreMars::Photo.new("http://www.image.com", 829, "FHAZ", "2015-6-3", "curiosity") }

    it "should have a src" do
      expect(photo.src).to eq("http://www.image.com")
    end

    it "should have a sol" do
      expect(photo.sol).to eq 829
    end

    it "should have a camera" do
      expect(photo.camera).to eq "FHAZ"
    end

    it "should have an earth_date" do
      expect(photo.earth_date.class).to eq Date
      expect(photo.earth_date).to eq Date.strptime("2015-6-3")
    end

    it "should have a rover" do
      expect(photo.rover).to eq "curiosity"
    end
  end

  describe "to_s" do
    it "should return the source url" do
      photo = ExploreMars::Photo.new("http://www.image.com", 829, "FHAZ", "2015-6-3", "curiosity")

      expect(photo.to_s).to eq photo.src
    end
  end
end
