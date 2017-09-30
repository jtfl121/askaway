Rails.application.routes.draw do
  devise_for :users

  resources :questions

  root to: 'questions#index'

  match '*path', :to => 'application#routing_error', :via => [:get]

end
