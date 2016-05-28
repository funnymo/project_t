Rails.application.routes.draw do

  devise_for :admins
  root 'pages#home'

  devise_for  :users,
              :path => "",
              :controllers => { registrations: 'registrations', :omniauth_callbacks => "users/omniauth_callbacks" },
              :path_names => {:sign_in => "login",
              :sign_out => "logout",
              :edit => "profile"}

  resources :users, only: [:show] do
    resources :galleries
    resources :pictures
  end

  resources :products
  resources :product_photos

  patch "/users/:user_id" => "users#update"
  patch "/products" => "products#index"
  get "/about_us" => "pages#about_us"
  get "/trail_upgrade" => "pages#upgrade"
  get "/contact_us" => "pages#contact_us"

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get "/premium" => "premium_transactions#create"
  get 'search', to: 'users#show'

  post '/notify' => 'transactions#notify'
  post '/notifypremium' => 'premium_transactions#notifypremium'

  resources :products do
    resources :transactions, only: [:create]
  end

  resources :users do
    resources :premium_transactions, only: [:create]
  end

end
