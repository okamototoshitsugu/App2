Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :books
  root :to => 'books#top'
  get 'home/about' => 'books#about'
  resources :post_images, only: [:new, :create, :index, :show]
end
