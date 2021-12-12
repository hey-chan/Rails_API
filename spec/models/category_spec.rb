require 'rails_helper'

RSpec.describe Category, type: :model do
  context "factory" do

    before(:all) do
      # build creates an object, an instance of our model category, but doesn't save to database only exists in memory
      @category = build(:category)
    end

    it "has a valid factory" do
      expect(@category).to be_valid
    end

    it "has the right name" do
      expect(@category.name).to eq("Community Park")
    end

  end
end
