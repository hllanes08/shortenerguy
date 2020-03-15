Rails.application.routes.draw do
  root to: 'home#index'
  get 'home/index'
  namespace :api do
    get 'shortener/:code', to: 'shortener#resolve', as: 'resolve_code'
    get 'top', to: 'shortener#index'
    post 'shortener', to: 'shortener#create'
  end 
end
