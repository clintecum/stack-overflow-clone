Rails.application.routes.draw do

  root 'questions#index'

  scope shallow_prefix: "user" do
    resources :users do
      resources :questions, shallow: true
      resources :answers, shallow: true
      resources :comments, shallow: true
      resources :votes, shallow: true
      resources :favorites, shallow: true
    end
  end

  concern :commentable do
    resources :comments
  end

  concern :voteable do
    resources :votes
  end

  concern :favorable  do
    resources :favorites
  end

  scope shallow_prefix: "hidden" do
    resources :questions, concerns: [:commentable, :voteable, :favorable] do
      resources :answers, concerns: [:commentable, :voteable], shallow: true
    end
  end
end
