require "rails_helper"

RSpec.describe Post, type: :model do
  context "factory" do
    before(:all) do
      # build creates an object, an instance of our model category, but doesn't save to database only exists in memory
      @post = build(:post)
    end

    # it "has a valid factory" do
    #   expect(@post).to be_valid
    # end

    it "has the right comment" do
      expect(@post.comment).to eq("I think this park is neat")
    end

    it "has the right rating" do
      expect(@post.rating).to eq(4)
    end
  end
end
