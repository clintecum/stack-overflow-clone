require 'rails_helper'

describe AnswersController do
  let!(:user)  {FactoryGirl.build(:user)}
  let!(:answer) {FactoryGirl.build(:answer)}

  describe "GET #index" do
    context "when on questions page" do
      it "assigns all the question's answers to @answers" do
        get :index, {id: 1}
        expect(assigns(:answers)).to_not be(nil)
        #not sure how to test to see that each answer has question_id
      end # it end
    end #context end
    context "when on users page" do
      it "assigns all the question's answers to @answers" do
        get :index, {user_id: 1}
        expect(assigns(:answers)).to_not be(nil)
        #not sure how to test to see that each answer has user_id
      end #it end
    end #context end
  end #GET index end

  describe "POST #create" do
    context "when logged in" do
      

      context "when attributes are valid" do
        it 'sucessfully creates an answer' do
          expect{ post :create, {id: 1, content: "blah", user: user }}.to change{Answer.all.size}
        end #it end
      end #context end

      context "when attributes are invalid" do
        it 'assigns a newly created but unsaved answer as @answer' do
          expect{ post :create, {id: 1, user: user }}.to change{Answer.all.size}
        end #it end
      end #context end
    end #context end

    context "when user is not logged in" do
      it 'assigns a newly created but unsaved answer as @answer' do
        expect{post :create, {id: 1, content: "blah"}}.to_not change{Answer.all.size}
      end #it end
    end #context end

  end #POST create end

  describe "PUT #update" do
  end #PUT update end

  describe "PATCH #update" do
  end #PATCH update end

  describe "DELETE #destroy" do
    context "when logged in" do
     
      it "assigns the resquested answer as @answer" do
        delete :destroy, { answer_id: answer.id, user: user  }
        expect(assigns(:answer)).to_eq(answer)
      end #it end
      it "destroys the requested game" do
        expect {
          delete :destroy, answer_id: answer.id, user: user 
        }.to change(Answer, :count).by(-1)
      end #it end
    end #context end
    context "when user is not logged in" do
      it "does not assign the resquested answer as @answer" do
        delete :destroy, {answer_id: answer.id }
        expect(assigns(:answer)).to be(nil)
      end #it end
    end
  end
end