Urdb::Application.routes.draw do
  get "showtimes/create"
  resources :movies do
    resources :showtimes
  end

  root 'movies#index'
end
