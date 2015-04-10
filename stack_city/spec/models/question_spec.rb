require 'rails_helper'

describe "Question" do
  question = FactoryGirl.create(:question)
  it "should have a title" do
     expect(FactoryGirl.build(:question, title: nil)).to_not be_valid
  end

  it "should have a body" do
     expect(FactoryGirl.build(:question, body: nil)).to_not be_valid
  end

  it "should be invalid without a user" do
    expect(FactoryGirl.build(:question, user: nil)).to_not be_valid
  end
end
