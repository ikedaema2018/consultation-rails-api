Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/test', to: 'users#test'

  post '/admin_users', to: 'admin_users#create'
  get '/admin_users', to: 'admin_users#index'

  get '/worry/:id', to: 'worries#show'
  post '/worry', to: 'worries#create'
  get '/worry', to: 'worries#index'
  
  post '/worry_comment', to: 'worry_comments#create'
end
