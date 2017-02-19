Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  post 'pages/paragraph', to: 'pages#set_paragraph'
  post 'pages/paragraph/todo/:id', to: 'pages#set_todo'
  post 'pages/paragraph/important/:id', to: 'pages#set_important'
  post 'pages/add_title', to: 'pages#add_title'
  post 'welcome/next_paragraph', to: 'welcome#next_paragraph'


  resources :pages
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
