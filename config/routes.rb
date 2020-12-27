Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'about' => 'homes#about'
  #get 'sign_up' =>
  #get 'sign_in' =>

  resources :users do
    get :unsubscribe, on: :collection
    patch :withdraw, on: :collection
  end

  resources :homes
  resources :makers, only: [:edit, :create, :index, :update]
  resources :post_comments
  resources :products



  #   devise_for :customers, :controllers => {
  #   :registrations => 'customers/registrations',
  #   :sessions => 'customers/sessions',
  #   :passwords => 'customers/passwords'
  # }

  # scope module: :public do
  #   root 'homes#top'
  #   get 'about' => 'homes#about'
  #   resources :products, only: [:index, :show] do
  #     collection do
  #       get 'search'
  #     end
  #   end
  #   resources :cart_products, only: [:index, :update, :destroy, :create] do
  #     collection do
  #       delete 'destroy_all'
  #     end
  #   end
  #   resources :orders, only: [:new, :create, :index, :show] do
  #     collection do
  #       post '/confirm' => 'orders#confirm'
  #       get '/done' => 'orders#done'
  #     end
  #   end
  #   resource :customers, only: [:edit, :update] do
  #     collection do
  #         get '/my_page' => 'customers#show'
  #         get '/unsubscribe' => 'customers#unsubscribe'
  #         patch '/withdraw' => 'customers#withdraw'
  #       end
  #     end
  #   resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
  # end

  # devise_for :admin, :controllers => {
  #   :registrations => 'admin/registrations',
  #   :sessions => 'admin/sessions',
  #   :passwords => 'admin/passwords'
  # }

  # namespace :admin do
  #   get '' => 'homes#top'
  #   get 'search' => 'searches#search'
  #   resources :products, only: [:index, :new, :create, :show, :edit, :update]
  #   resources :customers, only: [:index, :show, :edit, :update]
  #   resources :orders, only: [:index, :show, :update]
  #   resources :order_products, only: [:update]
  #   resources :genres, only: [:index, :create, :edit, :update]
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end