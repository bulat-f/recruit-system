Rails.application.routes.draw do
  root 'home#index'

  controller :session do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end
end
