Rails.application.routes.draw do
  
  #root :to => redirect('/books')

  #resources :books do
  #  resources :reviews
  #end
  
  resources :users
  
  match '/login', to: 'sessions#new', via: :get
  match '/login_create', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#destroy', via: :delete
  
  match '/new_staff_admin', to: 'roles#new', via: :get
  match '/new_staff_admin_create', to: 'roles#create', via: :post

  root 'books#index'
  get 'books/welcome', to: 'books#welcome'
  get 'books/list', to: 'books#index'
  get 'books/new', to: 'books#new'
  post 'books/create', to: 'books#create'
  post 'books/search', to: 'books#search'
  get 'books/topten', to: 'books#topten'
  get 'books/wiki', to: 'books#wiki'
  get 'books/delform', to: 'books#delform'
  post 'books/delete', to: 'books#delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
