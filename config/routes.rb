Rails.application.routes.draw do
  devise_for :users

  resources :questions do
    resources :answers
  end

  root to: 'questions#index'
  get 'tags/:tag', to: 'questions#index', as: :tag
  # get 'search/:q', to: 'questions#index', as: :q
  # resources :search, only: [:index]

  match '*path', :to => 'application#routing_error', :via => [:get]

end
