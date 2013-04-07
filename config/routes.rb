Vinebox::Application.routes.draw do
  resources :vines 
  
  match '/p/:vineid' => 'vines#proxy', :as => 'proxy'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end