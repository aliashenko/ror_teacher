RorTeacher::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  resources :users
  resources :courses
  resources :courses_user

  root  'courses#index'
  get   '/',                    to: 'courses#index',      as: "home"
  get   '/about',               to: 'static_pages#about'
  get   '/contact',             to: 'static_pages#contact'
  post  '/courses_user/start',  to: 'courses_user#start'

end
