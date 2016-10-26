Rails.application.routes.draw do
  
  root :to => redirect('/books')

  resources :books do
    resources :reviews
  end
  
  resources :users
  
  match '/login', to: 'sessions#new', via: :get
  match '/login_create', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#destroy', via: :delete

  post 'books/search_book'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
