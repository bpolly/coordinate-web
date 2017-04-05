Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chats
  resources :messages
  resource :users do
    post "update_location"
  end
end
