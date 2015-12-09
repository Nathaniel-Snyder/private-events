Rails.application.routes.draw do
  get 'sessions/new'

  resources :users,   only:  [:new, :create, :show]
  resources :events,  only:  [:new, :create, :show, :index]
  root 'users#index'
  get 'signup'    =>    'users#new'
  get 'login'     =>    'sessions#new'
  post 'login'    =>    'sessions#create'
  delete 'logout' =>    'sessions#destroy'
end
