Rails.application.routes.draw do

  resources :welcome, only: [:index, :about]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
