Rails.application.routes.draw do





  root to: 'pages#index'
  resources :attractions
  resources :users, except: :index
  resources :sessions, only: :create
  resources :rides, only: [:new, :create]
  #get '/sign_up' => 'users#new'
  get '/signin' => 'users#index'
  get '/logout' => 'sessions#destroy'
  #post "/new" => "rides#new"

end
