require 'rails_helper'

describe AnswersController do
  let!(:user)  {FactoryGirl.build(:user)}

  describe "GET #index" do
    context "when on questions page" do
      it "assigns all the question's answers to @answers" do
        get :index, {id: 1}
        expect(assigns(:answers)).to_not be(nil)
        #not sure how to test to see that each answer has question_id
      end
    end
    context "when on users page" do
      it "assigns all the question's answers to @answers" do
        get :index, {user_id: 1}
        expect(assigns(:answers)).to_not be(nil)
        #not sure how to test to see that each answer has user_id
      end
    end
  end

  describe "POST #create" do
    context "when logged in" do
      session[:user_id] = user.id

      context "when attributes are valid" do
        it 'sucessfully creates an answer'
          expect{post :create, {id: 1, content: "blah"}}.to change{Answer.all.size})
        end
      end
      context "when attributes are invalid" do
        it 'assigns a newly created but unsaved answer as @answer' do
          expect{post :create, {id: 1}}.to change{Answer.all.size})
        end
      end
    end

    context "when user is not logged in" do
      it 'assigns a newly created but unsaved answer as @answer' do
        expect{post :create, {id: 1, content: "blah"}}.to_not change{Answer.all.size})
      end
    end
  end

  describe "PUT #update" do
  end

  describe "PATCH #update" do
  end

  describe "DELETE #destroy" do
  end
end
