Vinebox::Application.routes.draw do
  resources :boxes


  resources :vines do
    #post 'proxy', :on => :collection
  end
  
  match '/p/:vineid' => 'vines#proxy', :as => 'proxy'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end