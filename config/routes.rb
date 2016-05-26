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

  get "/about_us" => "pages#about_us"

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end


  get 'search', to: 'users#show'

  resources :products do
    resources :transactions, only: [:create]
  end


end
