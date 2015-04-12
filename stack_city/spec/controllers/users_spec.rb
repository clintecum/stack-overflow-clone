require 'rails_helper'

describe UsersController do
  describe "GET #index" do
    it "assigns all users as @users" do
      get :index
      expect(assigns(:users)).to eq(User.all)
    end
  end

  describe "GET #show" do
    it "should assign a user with a given id as @user" do
        get :show, {id: 1}
        expect(assigns(:user)).to eq(User.find(1))
    end
  end

  describe "POST #create" do
    it "should create a new user with given params" do
        expect{post :create, {user: {username: "DonkeySmell", password: "1234", email: "yay@gmail.com"}}}.to change{User.all.size}
    end
  end

  describe "PUT #update" do
    #built update controller (possible issue there), syntax for testing update seems okay but might also be causing the problem.
    #google more.
    xit "should update user info from given params" do
        user = FactoryGirl.create(:user)
        expect{
        put :update, { id: user.id, user: {email:  "john.doe@example1.com"}}}.to change(user, :email)
        end
    end

  describe "DELETE #destroy" do
    it "should delete your user" do
        user = User.all.first
      expect {
        delete :destroy, id: user.id
      }.to change(User, :count).by(-1)
    end
  end
end
