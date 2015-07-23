Rails.application.routes.draw do

  resources :registered_applications
  devise_for :users
  resources :welcome, only: [:index, :about]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
