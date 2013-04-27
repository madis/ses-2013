require "test_helper"

describe AdsEntry do
  before do
    @ads_entry = AdsEntry.new
  end

  it "must be valid" do
    @ads_entry.valid?.must_equal true
  end
end
