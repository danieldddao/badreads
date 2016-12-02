Rails.application.routes.draw do
  
  resources :meetings
  root 'books#index'
  
  #Book Routes:
  resources :books
  get 'allbooks', to: 'books#allbooks'
  post 'books/search', to: 'books#search'
  get 'booksdelform', to: 'books#delform'
  post 'deletebook', to: 'books#delete'
  
  #Review Routes:
  post '/books/:id/review_create', to: 'reviews#create', :as => 'review_create'

  #User Routes:
  resources :users, only: [:show, :new, :create, :update ,:edit] do
    collection do
      post 'emailref'
      post 'emailpwd'
      get 'emailpwd'
    end
  end
  match '/reset' , to: 'users#reset' , via: :get
  
  #Login and logout Routes:
  match '/login', to: 'sessions#new', via: :get
  match '/login_create', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#destroy', via: :delete
  
  #New Role Routes:
  match '/new_staff_admin', to: 'roles#new', via: :get
  match '/new_staff_admin_create', to: 'roles#create', via: :post
  
  
  #Common Interest Group Routes:
  match '/view_calendar', to: 'groups#view_calendar', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #Google Call Back:
  get 'auth/:provider/callback', to: 'groups#view_calendar'
  
  #Follows Routes:
  post '/users/:user_id/:book_id/new_following', to: 'follows#create', :as => 'new_following_user'
  delete '/users/:user_id/:book_id/delete_following', to: 'follows#destroy', :as => 'delete_following_user'
  get '/users/:id/showFollowing', to: 'follows#showFollowing', :as => 'user_show_following'
  get '/users/:id/showFollowers', to: 'follows#showFollowers', :as => 'user_show_followers'

end
