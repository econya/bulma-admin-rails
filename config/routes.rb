Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'dashboard',     to: 'pages#dashboard'
  get 'forms',         to: 'pages#forms'
  get 'presentations', to: 'pages#presentations'
end
