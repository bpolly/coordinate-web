Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/get_chats', to: 'chats#get_chats'

  resources :chats
  resources :messages
  resources :users do
    post "update_location"
  end
end
