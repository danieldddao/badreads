Rails.application.routes.draw do
  
  root 'books#index'

  resources :books do
    resources :reviews
  end
  get 'allbooks', to: 'books#allbooks'
  post 'books/search', to: 'books#search'
  get 'booksdelform', to: 'books#delform'

  
  resources :users
  
  match '/login', to: 'sessions#new', via: :get
  match '/login_create', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#destroy', via: :delete
  
  match '/new_staff_admin', to: 'roles#new', via: :get
  match '/new_staff_admin_create', to: 'roles#create', via: :post

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
