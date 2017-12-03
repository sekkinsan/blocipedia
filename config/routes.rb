Rails.application.routes.draw do

  get 'collaborators/index'

  get 'collaborators/show'

  get 'collaborators/new'

  get 'collaborators/edit'

  resources :wikis

  resources :wikis do 
    resources :collaborators, only: [:new, :create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :charges, only: [:new, :create]

  match "users/:id/downgrade" => "users#downgrade", :as => "downgrade_user", via: [:get, :post]

  get 'about' => 'welcome#about'

  root 'welcome#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
