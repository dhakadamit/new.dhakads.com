NewDhakadsCom::Application.routes.draw do
  resources :sessions, :only => [:new, :create]

  get '/sessions/login', :to => 'sessions#new', :as => 'login'
end
