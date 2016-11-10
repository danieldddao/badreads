Rails.application.routes.draw do
  
  root 'books#index'

  resources :books do
    resources :reviews
  end
  
  get 'allbooks', to: 'books#allbooks'
  post 'books/search', to: 'books#search'
  get 'booksdelform', to: 'books#delform'
  post 'deletebook', to: 'books#delete'

  resources :users, only: [:show, :new, :create, :update]
  
  match '/login', to: 'sessions#new', via: :get
  match '/login_create', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#destroy', via: :delete
  
  match '/new_staff_admin', to: 'roles#new', via: :get
  match '/new_staff_admin_create', to: 'roles#create', via: :post
  
  #Common Interest Group Routes:
  match '/view_calendar', to: 'groups#view_calendar', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
