Rails.application.routes.draw do
  root to: "home#index"

  resources :vaccinations, only: [:index] do
    collection { post :import }
  end
  devise_for :users
end
