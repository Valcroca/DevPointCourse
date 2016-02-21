Rails.application.routes.draw do
  

 root 'stickies#index'
 resources :stickies
end
