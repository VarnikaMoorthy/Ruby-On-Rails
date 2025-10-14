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

  # session-based user signup/login (no DB)
  get  '/signup', to: 'users#new',    as: :signup
  post '/signup', to: 'users#create'

  get    '/login',  to: 'sessions#new',     as: :login
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :logout
end
