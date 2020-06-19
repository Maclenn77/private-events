Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:create, :new, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.input_html
  get '/sign_up', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  get 'log_out', to: 'sessions#destroy'
end
