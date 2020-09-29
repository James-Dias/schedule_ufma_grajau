Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  devise_for :users
  resources :schedules
  get 'available_schedules', to: 'schedules#available_schedules', as: :available_schedules
  get 'solicitation_schedules/:id', to: 'schedules#solicitation_schedules', as: :solicitation_schedules
  get 'my_solicitations', to: 'schedules#my_solicitations', as: :my_solicitations
  get 'confirmation_schedules/:id', to: 'schedules#confirmation_schedules', as: :confirmation_schedules
  get 'inativation_schedules/:id', to: 'schedules#inativation_schedules', as: :inativation_schedules
  resources :departments
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
