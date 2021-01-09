Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'

  resources :users do
    get :unsubscribe, on: :collection
    patch :withdraw, on: :collection
  end

  resources :products do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  resources :homes
  resources :makers, only: [:edit, :create, :index, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end