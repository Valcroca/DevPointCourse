Rails.application.routes.draw do
  
  root 'zoos#index'

  resources :zoos do
    resources :animals
    resources :lions, controller: 'animals', type: 'Lion'
    resources :bears, controller: 'animals', type: 'Bears'
    resources :elephants, controller: 'animals', type: 'Elephant'
    resources :monkeys, controller: 'animals', type: 'Monkey'
  end
end
