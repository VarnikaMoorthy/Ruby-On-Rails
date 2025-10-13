Rails.application.routes.draw do
  # Root route
  root "products#index"

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Resourceful routes for products
  resources :products
end
