Rails.application.routes.draw do
  
  root :to => redirect('/books')

  resources :books do
    resources :reviews
  end
  
  resources :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
