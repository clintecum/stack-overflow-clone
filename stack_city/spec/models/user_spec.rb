require 'rails_helper'

describe "User" do
  user = FactoryGirl.build(:user)
  it "should exist" do
      expect(user).to_not be(nil)
    end

  it "should have a username" do
    expect(user.username).to eq("IamDwyane")
    end

  it "has to have an email" do
    expect(user.email).to eq("myemail@gmail.com")
    end

  it "an ill formatted email should not be valid" do
    expect(FactoryGirl.build(:user, email: "5.com")).to_not be_valid
    end
  end



