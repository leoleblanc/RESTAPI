Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :show, :update]

  get '/users/:id/tools', to: "users#get_tools"
  post '/users/:id/tools', to: "users#add_tools"
end
