require "rails_helper"

RSpec.describe Park, type: :model do
  context "factory" do
    before(:all) do
      # build creates an object, an instance of our model category, but doesn't save to database only exists in memory
      @park = build(:park)
    end

    # it "has a valid factory" do
    #   expect(@park).to be_valid
    # end

    it "has the right name" do
      expect(@park.name).to eq("Flagstaff Gardens")
    end

    it "has the right cheese" do
      expect(@park.cheese).to eq("Blue cheese")
    end

    it "has the right name" do
      expect(@park.wine).to eq("White wine")
    end
  end
end
