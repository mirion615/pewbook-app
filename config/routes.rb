Rails.application.routes.draw do
  root "quizzes#index"
  devise_for :users
  resources :users, only: [:show]
  resources :quizzes do
    collection do
      get 'form'
      get 'word'
    end
  end
  
  namespace :api, { format: 'json'} do
    namespace :v1 do
      resources :quizzes do
        collection do
          get 'word'
          get 'form'
          get 'user_words'
        end
      end
    end
  end


end
