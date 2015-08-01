Rails.application.routes.draw do
  resources :domains

  root 'home#index'
end
