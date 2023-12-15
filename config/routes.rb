Rails.application.routes.draw do
  devise_for :users
  resources :questions, only: [:new, :create]
  resources :subjects do
    resources :lecturers, except: [:show]
  end

  resources :lecturers do
    resources :requests, only: [:new, :create]
  end

  resources :requests, only: [:index]

  root 'pages#home'
end
