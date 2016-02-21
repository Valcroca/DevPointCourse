Rails.application.routes.draw do
  
  root 'dashboard#index'
  post 'dashboard', to: 'dashboard#write', as: 'write_file'
  post 'read_file', to: 'dashboard#read', as: 'read_file'
  
end
