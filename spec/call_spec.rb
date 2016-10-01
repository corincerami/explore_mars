require "spec_helper"

describe ExploreMars::Call do
  it "should have proper constants" do
    expect(ExploreMars::Call::CAMERAS).to eq ["FHAZ", "RHAZ", "MAST", "CHEMCAM", "NAVCAM", "MAHLI", "MARDI", "PANCAM", "MINITES"]
  end
end
