Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#index'
  resource :dashboard, only: [:show]
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end

  resources :lessons, only: [:show]
  namespace :instructor do
    resources :lessons, only: [:update]
    resources :sections, only: [:update]
    resources :sections, only: [] do
      resources :lessons, only: [:create]
    end
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
  end
end
