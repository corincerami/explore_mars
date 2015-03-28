require "spec_helper"

describe ExploreMars::Photo do
  describe "attributes" do
    it "should contain src, sol, and camera" do
      photo = ExploreMars::Photo.new("http://www.image.com", 829, "FHAZ")

      expect(photo.src).to eq("http://www.image.com")
      expect(photo.sol).to eq 829
      expect(photo.camera).to eq "FHAZ"
    end
  end
end
