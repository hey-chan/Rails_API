require "rails_helper"

RSpec.describe Address, type: :model do
  context "address factory" do
    before(:all) do
      # build creates an object, an instance of our model category, but doesn't save to database only exists in memory
      @address = build(:address)
    end

    it "has a valid factory" do
      expect(@address).to be_valid
    end

    it "has the right street number" do
      expect(@address.number).to eq(120)
    end

    it "has the right street name" do
      expect(@address.street).to eq("Spencer Street")
    end

    it "has the right suburb" do
      expect(@address.suburb).to eq("Melbourne")
    end

    it "has the right postcode" do
      expect(@address.postcode).to eq("3000")
    end
  end
end
