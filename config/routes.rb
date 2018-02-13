Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'dashboard',     to: 'pages#dashboard'
  get 'forms',         to: 'pages#forms'
  get 'presentations', to: 'pages#presentations'
  get 'tables',        to: 'pages#tables'
  get 'ui-elements',   to: 'pages#ui_elements'
  get 'notifications', to: 'pages#notifications'
  get 'login',         to: 'pages#login'
  get 'datatables',    to: 'tables#index'
end
