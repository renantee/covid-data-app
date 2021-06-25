Rails.application.routes.draw do
  root to: "home#index"

  resources :vaccinations, only: [:index] do
    collection {
      post :import
      delete :destroy
    }
  end
  # devise_for :users
  devise_for :users, path: '', path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
end
