Rails.application.routes.draw do
  root "labels#search"
  get  '/search',  to: 'labels#search'
  post '/search',  to: 'labels#show'
end
