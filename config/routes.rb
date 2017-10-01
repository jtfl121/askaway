Rails.application.routes.draw do
  devise_for :users

  resources :questions do
    resources :answers
  end

  root to: 'questions#index'

  match '*path', :to => 'application#routing_error', :via => [:get]

end
