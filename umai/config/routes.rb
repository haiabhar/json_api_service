Rails.application.routes.draw do
  resources :feedbacks
  resources :ratings
  resources :posts
  resources :users
  post 'login', to: 'authentication#login'
  
end
