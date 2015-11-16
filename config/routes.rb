Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show, :update, :destroy]

  resources :contact_shares, only: [:create, :destroy]
end
