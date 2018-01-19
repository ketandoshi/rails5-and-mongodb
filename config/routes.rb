Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/get-book-info' => 'search#get_book_info'

  root to: 'search#index'
end
