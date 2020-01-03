Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  resources :wishes
  resources :players, only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :champs, only: [:show, :index]
  resources :skins, only: [:show, :index]
  delete '/session', to: 'sessions#destroy', as: 'logout'
  get '/sessions/new', to: 'sessions#new', as: 'login'
end
