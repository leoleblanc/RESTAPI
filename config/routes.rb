Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :create, :show, :update]
  resources :apps, only: [:index, :create, :show, :update]

  get '/users/:id/tools', to: "users#get_tools"
  post '/users/:id/tools', to: "users#add_tools"

  get '/users/:id/show_apps', to: "users#show_apps_for_user"
  post '/users/:id/add_apps', to: "users#add_apps_for_user"

  get '/apps/:id/show_users', to: "apps#show_users_for_app"
  post '/apps/:id/add_users', to: "apps#add_users_for_app"
end
