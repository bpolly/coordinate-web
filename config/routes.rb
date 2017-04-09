Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/get_chats', to: 'chats#get_chats'
  post '/users/update_location', to: 'users#update_location'

  resources :chats, :defaults => { :format => 'json' }
  resources :messages, :defaults => { :format => 'json' }
  resources :users, :defaults => { :format => 'json' }
end
