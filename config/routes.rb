Rails.application.routes.draw do

  resources :wikis

  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'

  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
