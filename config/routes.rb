Rails.application.routes.draw do
  root to: 'papers#index'
  resources :authors
  resources :papers
  resources :publications
  resources :publishers
  resources :keywords
  resources :locales
end
