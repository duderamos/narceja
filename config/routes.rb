Rails.application.routes.draw do
  devise_for :users
  resources :domains 
  resources :mailboxes
  resources :forwarders

  patch 'mailboxes/:id/newpassword', to: 'mailboxes#newpassword', as: 'newpassword_mailboxes'

  root 'home#index'
end
