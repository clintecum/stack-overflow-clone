require 'rails_helper'

describe AnswersController do

  describe "GET #index" do

    context "when on users page" do

      it "assigns all the user's answers to @answers" do
        user = FactoryGirl.create(:user)
        FactoryGirl.create(:answer, user: user )
        get :index, {user_id: user.id}
        expect(assigns(:answers)).to_not be(nil)
        #not sure how to test to see that each answer has user_id
      end #it end

    end #context end

  end #GET index end

  describe "POST #create" do
    question = FactoryGirl.create(:question)

    let!(:user) {User.create(username: "IamDwyane", email: "myemail@gmail.com", password: "poop")}

    context "when attributes are valid" do

      xit 'sucessfully creates an answer' do

        expect{post :create, {question_id: question.id , content: "blah", user: user.id}}.to change{Answer.all.size}

      end #it end

    end #context end

    context "when attributes are invalid" do
      xit 'assigns a newly created but unsaved answer as @answer' do
        expect{ post :create, {question_id: question.id , user: user }}.to_not change{Answer.all.size}
      end #it end
    end #context end

    context "when user is not logged in" do
      xit 'assigns a newly created but unsaved answer as @answer' do
        expect{post :create, {question_id: question.id , content: "blah"}}.to_not change{Answer.all.size}
      end #it end
    end #context end
  end #POST create end

  describe "PUT #update" do
  end #PUT update end

  describe "PATCH #update" do
  end #PATCH update end

  describe "DELETE #destroy" do

    xit "assigns the resquested answer as @answer" do
      delete :destroy, { id: answer.id }
      expect(assigns(:answer)).to_eq(answer)
    end #it end

    xit "destroys the requested game" do
      expect {delete :destroy, {id: answer.id}}.to change{Answer.all.size}.by(-1)
    end #it end

    context "when user is not logged in" do
      xit "does not assign the resquested answer as @answer" do
        delete :destroy, {id: answer.id }
        expect(assigns(:answer)).to be(nil)
      end #it end
    end#context end
  end #context end
end


