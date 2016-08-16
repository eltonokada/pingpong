Rails.application.routes.draw do
  devise_for :users
  resources :games
  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
end
