Rails.application.routes.draw do
  get 'welcome/index'
  post 'pages/paragraph', to: 'pages#set_paragraph'
  post 'pages/paragraph/todo/:id', to: 'pages#set_todo'
  post 'pages/paragraph/important/:id', to: 'pages#set_important'

  resources :pages
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
