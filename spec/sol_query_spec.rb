require "spec_helper"

describe ExploreMars::SolQuery do
  describe "attributes" do
    it "should have a sol and a camera" do
      query = ExploreMars::SolQuery.new("curiosity", 940, "FHAZ")

      expect(query.rover).to eq "curiosity"
      expect(query.sol).to eq 940
      expect(query.camera).to eq "FHAZ"
    end
  end

  describe "cameras" do
    it "should be valid" do
      expect{
        ExploreMars::SolQuery.new("curiosity", 940, "FHAZ").get
      }.not_to raise_error

      expect{
        ExploreMars::SolQuery.new("curiosity", 940, "Not a camera").get
      }.to raise_error
    end
  end

  describe "sol"
end
