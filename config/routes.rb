Rails.application.routes.draw do
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  root "calendar#index"
  resources :users
  resources :topics
  resources :calendar
  resources :schedules, only: %i[new show create update destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :daily_stacks, only: %i[index new show create update destroy]
  resources :expense_categories, only: %i[new create update]
  # Almost every application defines a route for the root path ("/") at the top of this file.
  # root "articles#index"
end
