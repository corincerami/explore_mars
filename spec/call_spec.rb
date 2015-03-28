require "spec_helper"

describe ExploreMars::Call do
  it "should have a sol and camera attribute" do
    call = ExploreMars::Call.new(0, "FHAZ")

    expect(call.sol).to eq(0)
    expect(call.camera).to eq "FHAZ"
  end

  it "only correct cameras will work" do
    good_call = ExploreMars::Call.new(0, "FHAZ").get
    expect(good_call.class).to eq(Array)
  end
end
