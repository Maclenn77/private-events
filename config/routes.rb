Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.input_html
  get 'sign_up', to: 'users#new'
  get 'users/show/:id', to: 'users#show'

  #Routes for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Routes for events
  get 'create_event', to: 'events#new'
  post 'events', to: 'events#create'
  get 'events', to: 'events#index'
  get 'events/show/:id/', to: 'events#show', as: 'event_show'


  root 'users#index'

end
