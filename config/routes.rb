Rails.application.routes.draw do

  devise_for :admins
  root 'pages#home'

  devise_for  :users,
              :path => "",
              :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" },
              :path_names => {:sign_in => "login",
              :sign_out => "logout",
              :edit => "profile"}

  resources :users, only: [:show] do
    member do 
      get :confirm_email
    end
  end
  resources :products
  resources :product_photos


end
