Rails.application.routes.draw do
  get 'todos/create'
  resources :tareas, only: :index do
  	resources :todos
  end

  root 'tareas#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
