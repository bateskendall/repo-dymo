Rails.application.routes.draw do
  resources :labels
  root "labels#new"
  get  '/search',  to: 'labels#search'
  post '/search',  to: 'labels#show'
end
