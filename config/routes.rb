Rails.application.routes.draw do
  resources :articles
  devise_for :users, 
  path:'',
  path_names: {
       sign_in: '/login',
       sign_out: '/logout',
       registration: '/signup'
     },
    controllers: {
     sessions: 'users/sessions',
     registrations: 'users/registrations'
   }
  #get '/member-data', to: 'members#show'

  #namespace :api, defaults: { format: :json } do
  #  resources :users, only: %w[show]
  #end
#
  #devise_for :users,
  #  defaults: { format: :json },
  #  path: '',
  #  path_names: {
  #    sign_in: 'api/login',
  #    sign_out: 'api/logout',
  #    registration: 'api/signup'
  #  },
  #  controllers: {
  #    sessions: 'user/sessions',
  #    registrations: 'user/registrations'
  #  }
end