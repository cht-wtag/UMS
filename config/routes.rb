# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  resources :departments do
    resources :students
    resources :courses
    resources :faculties
  end
  resources :courses do
    resources :students
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
