Rails.application.routes.draw do

  mount Shoppe::Engine => "/shoppe"
  devise_for :admins
  # root 'pages#home'

  devise_for  :users,
              :path => "",
              :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" },
              :path_names => {:sign_in => "login",
              :sign_out => "logout",
              :edit => "profile"}

  resources :users, only: [:show]
  # resources :products
  resources :product_photos


  get "/about_us" => "pages#about_us"

  resources :galleries
  resources :pictures
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get "product/:permalink", to: "products#show", as: "product"
  post "product/:permalink", to: "products#buy", as: "buy"
  post "product/:permalink", to: "products#buy"
  root to: "products#index"
  get "basket", to: "orders#show"
  delete "basket", to: "orders#destroy"

  match "checkout", to: "orders#checkout", as: "checkout", via: [:get, :patch]
  match "checkout/pay", to: "orders#payment", as: "checkout_payment", via: [:get, :post]
  match "checkout/confirm", to: "orders#confirmation", as: "checkout_confirmation", via: [:get, :post]

end
