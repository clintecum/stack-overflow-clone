require 'rails_helper'

describe QuestionsController do
  describe "GET #index" do
    it "assigns all questions as @questions" do
      get :index
      expect(assigns(:questions)).to eq(Question.all)
    end
  end

  describe "GET #show" do
    it "should assign a question with a given id as @question" do
        get :show, {id: 1}
        expect(assigns(:question)).to eq(Question.find(1))
    end
  end

  describe "POST #create" do
    #current user problem
    xit "should create a new question with given params" do
        expect{post :create, {question: {title: "DonkeySmell", body: "What does that title mean?", user: User.first}}}.to change{Question.all.size}
    end
  end

  describe "PUT #update" do
    #built update controller (possible issue there), syntax for testing update seems okay but might also be causing the problem.
    #google more.
    xit "should update question info from given params" do
        user = FactoryGirl.create(:user)
        question = FactoryGirl.create(:question)
        expect{
        put :update, {id: 1,  question: {title: "????"}}
          user.reload
          }.to change(question, :title)
        end
    end

  describe "DELETE #destroy" do
    xit "should delete your user" do
        question = Question.all.first
      expect {
        delete :destroy, id: question.id
      }.to change(Question, :count).by(-1)
    end
  end
end

