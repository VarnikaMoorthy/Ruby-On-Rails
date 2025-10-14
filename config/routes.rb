Rails.application.routes.draw do
  # Root path
  root "products#index"

  # Products routes with custom member routes for buy/purchase
  resources :products do
    member do
      get :buy        # /products/:id/buy
      post :purchase  # /products/:id/purchase
    end
  end
end
