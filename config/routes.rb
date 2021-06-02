Rails.application.routes.draw do
  devise_for :users
  root "quizzes#index"
  resources :quizzes do
    collection do
      get 'form'
    end
  end
  resources :users, only: [:show]

  namespace :api, { format: 'json'} do
    namespace :v1 do
      resources :quizzes
    end
  end
end
