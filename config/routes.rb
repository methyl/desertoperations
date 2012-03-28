DesertOperations::Application.routes.draw do

  get "/login" => "sessions#new", :as => "logout"
  get "/logout" => "sessions#destroy", :as => "logout"
  post "/login" => "sessions#create"

  resources :users
  resources :invitations, :only => :create
  resources :worlds, :only => :index
  resources :players
  
  resource :spy, :controller => "spy" do
    collection do
      
      get 'index'
      post 'find'
      post 'check'
      post 'validate'
      post 'remind'
      
    end
  end
  
  

  root :to => "home#index"

end
