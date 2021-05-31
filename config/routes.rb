Rails.application.routes.draw do
  devise_for :users
  root "quizzes#index"
  resources :quizzes

  namespace :api, { format: 'json'} do
    namespace :v1 do
      resources :quizzes
    end
  end
end
