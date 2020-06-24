Rails.application.routes.draw do
  resources :users
  resources :sessions, only: %i[create new destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.input_html
  get 'sign_up', to: 'users#new'
  get 'show', to: 'users#show'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  root 'users#index'

end
