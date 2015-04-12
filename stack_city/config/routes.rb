Rails.application.routes.draw do

  root 'questions#index'

    resources :users do
      resources :questions, only: :index
      resources :answers, only: :index
      resources :comments, only: :index
      resources :votes, only: :index
      resources :favorites, only: :index
    end

    resources :comments
    resources :questions
end

# /questions/id
# /questions
# /quesitons/new
# /quesitons/edit
# /questions/id/answers/

