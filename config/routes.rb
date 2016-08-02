Rails.application.routes.draw do
  resources :bottles
  resources :users
  resources :clubs do
    resources :tables
  end

  resources :reservations do
    resources :reservation_bottles
  end

  post '/reservation_bottles/:bottle_id' => 'reservation_bottles#create'

  resources :tables do
    resources :reservations
  end

  root 'sessions#check'

  get 'sessions/create'
  get 'sessions/destroy'
  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'users#new'
  post '/login' => 'sessions#create'
  post '/login_club' => 'sessions#create_club'
  get '/logout' => 'sessions#destroy'
  get '/logout_club' => 'sessions#destroy_club'

  # These routes will be for signup. The first renders a form in the browse, the second will
  # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  post '/clubs' => 'clubs#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
