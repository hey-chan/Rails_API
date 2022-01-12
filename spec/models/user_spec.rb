require "rails_helper"

RSpec.describe User, type: :model do
  context "factory" do
    before(:all) do
      @user = build(:user)
    end

    it "has a valid factory" do
      expect(@user).to be_valid
    end

    it "has the right name" do
      expect(@user.username).to eq("tester")
    end
  end

  context "validations" do
    before(:each) do
      @user = build(:user)
    end

    it "is invalid without a username" do
      @user.username = nil
      # We should expect this to fail when username is present
      expect(@user).to_not be_valid
    end

    it "is invalid without an email address" do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a password confirmation" do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it "is invalid when password confirmation does not match up with password" do
      # In user factory, password is password1
      user = build(:user, password_confirmation: "password")
      expect(user).to_not be_valid
    end
  end
end
