require "spec_helper"

describe ExploreMars::Call do
  it "should have proper constants" do
    expect(ExploreMars::Call::BASE_URI).to eq "https://mars-curiosity-api.herokuapp.com/api/v1/rovers/"
    expect(ExploreMars::Call::CAMERAS).to eq ["FHAZ", "RHAZ", "MAST", "CHEMCAM", "NAVCAM", "MAHLI", "MARDI", "PANCAM", "MINITES"]
  end
end
