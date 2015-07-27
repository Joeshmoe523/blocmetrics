Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do 
    match 'create_event', to:"events#create", via: [:options]
    resources :events, only: [:create]
  end

  resources :registered_applications
  devise_for :users
  resources :welcome, only: [:index, :about]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
