require 'rails_helper'

describe "Answer" do
  answer = FactoryGirl.create(:answer)
  it "should have a question" do
    expect(FactoryGirl.build(:answer, question: nil)).to_not be_valid
  end

  it "should have a user" do
    expect(FactoryGirl.build(:answer, user: nil)).to_not be_valid
  end

  it "should have content" do
    expect(FactoryGirl.build(:answer, content: nil)).to_not be_valid
  end
end
