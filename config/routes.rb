Rails.application.routes.draw do
  root to: "home#index"

  resources :vaccinations, only: [:index] do
    collection {
      post :index
      post :import
      delete :destroy
    }
  end
  devise_for :users
end
