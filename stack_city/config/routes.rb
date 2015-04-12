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



    resources :questions do
      resources :answers
    end

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
