Rails.application.routes.draw do
  root "application#hello"
  resources :users
  resources :topics
  resources :schedule
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :daily_stacks, only: %i[index new show create update destroy]
  resources :expense_categories, only: %i[index create destroy]
  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
end
