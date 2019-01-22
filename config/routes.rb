Rails.application.routes.draw do
  resources :labels
  root "labels#new"
end
