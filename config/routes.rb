Rails.application.routes.draw do
  root 'home#index'

  controller :session do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end

  resources :locations
  resources :cleaners
  resources :permanents,   controller: :assignments, type: 'Permanent'
  resources :replacements, controller: :assignments, type: 'Replacement'
end
