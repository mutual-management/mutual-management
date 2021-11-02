Rails.application.routes.draw do
  get 'graph/index'
  root "application#hello"
  resources :users
  resources :topics
end
