require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  user = FactoryGirl.create(:user)
  question = FactoryGirl.create(:question)
  let!(:comment) { Comment.create!(:content => "waaa i'm a crying baby", :user_id => user.id, :commentable_id => question.id) }
  let!(:comments) {  5.times do
                       Comment.create(content: "waaa i'm a crying baby", :user_id => user.id)
                     end
                  }

  describe "Get#index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end

    it "assigns all comments as @comments" do
      assigns(:comments)
      get :index, { question_id: comments.to_param }
      expect(response).to be_success
    end
  end

  describe "Get#new" do
    it "gets new" do
      get :new, { id: question.id }
     expect(response).to be_success
    end
  end

  describe "Get#show" do
    it 'shows comment' do
      assigns(:comment)
      get :show, { id: comment.to_param }

      expect(response).to be_success
    end
  end

  describe "Post#create" do
    it "creates a new instance of comment as @comment for user" do
        expect{post :create, {id: question.id, comment: { content: "this bee is going to kill us"}}}.to change{Comment.all.count}
        assert_redirected_to comment_path(assigns(:comment))
     end
  end
end

