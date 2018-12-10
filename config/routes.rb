Rails.application.routes.draw do
  root to: 'childlogs#index'
  resources :childlogs
  
end
