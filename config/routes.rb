DesertOperations::Application.routes.draw do

  get "login" => "sessions#new", :as => "logout"
  get "logout" => "sessions#destroy", :as => "logout"
  post "login" => "sessions#create"

  resources :users

  root :to => "home#index"

end
