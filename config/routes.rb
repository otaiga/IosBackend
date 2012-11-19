IosBackend::Application.routes.draw do
  devise_for :users

  root :to => 'mains#index'

  resources :members

end
