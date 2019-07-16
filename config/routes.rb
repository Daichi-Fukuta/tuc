Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :users, :only => [:show]
  resources :items do
    resources :comments, except: :index
  end
  root 'items#index'
  post "/items/procedure" => "items#procedure"
end
