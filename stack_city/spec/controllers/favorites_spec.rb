require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do
  user = FactoryGirl.create(:user)
  question = FactoryGirl.create(:question)
  let!(:favorite) { Favorite.create! }

  describe "Get#new" do
    it "gets new" do
      get :new, {id: question.id }
      assert_response :success
    end
  end

  describe "Get#show" do
    it 'shows favorite' do
      get :show, id: @favorite
      assert_response :success
    end
  end

  describe "Post#create" do
    it "creates a new instance of favorite as @favorite for user" do

    end
  end
end
