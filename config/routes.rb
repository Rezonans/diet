Rails.application.routes.draw do
  devise_for :users, skip: :all, failure_app: CustomAuthFailure

  devise_scope :user do
    post    'login', to: 'devise/sessions#create'
    post    'registration', to: 'devise/registrations#create'
  end
  
  resources :users, only: [:show, :update]
  resources :meals, except: [:new, :edit]
end
