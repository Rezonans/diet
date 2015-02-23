Rails.application.routes.draw do
  scope :api do
    devise_for :users, path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'registration'
    }
    resources :users, only: [:show, :update] do
      resources :meals, except: [:new, :edit]
    end
    resources :meals, except: [:new, :edit]
  end
end
