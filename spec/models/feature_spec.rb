require "rails_helper"

RSpec.describe Feature, type: :model do
  context "factory" do
    before(:all) do
      # build creates an object, an instance of our model category, but doesn't save to database only exists in memory
      @feature = build(:feature)
    end

    it "has a valid factory" do
      expect(@feature).to be_valid
    end

    it "has the right name" do
      expect(@feature.name).to eq("all")
    end
  end
end
