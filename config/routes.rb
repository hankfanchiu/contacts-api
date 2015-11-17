Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:index, :create, :show, :update, :destroy] do
    resources :contacts, only: :index

    get 'contacts/groups', to: "user#contact_groups"
    get 'contacts/favorites', to: "user#favorite_contacts"

    resources :comments, only: :index
  end

  resources :contacts, only: [:create, :show, :update, :destroy] do
    get 'favoritors', on: :member
    resources :comments, only: :index
  end

  resources :contact_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy, :update, :show]
end
