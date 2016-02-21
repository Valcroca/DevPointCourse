Rails.application.routes.draw do
  
  root 'signup#index'
  post 'signup/create', to: 'signup#create', as: 'signup'
end
