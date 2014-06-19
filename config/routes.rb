Rails.application.routes.draw do
  
    
  root to: 'home#index'

  #get   'occurrence/new', to: 'occurrence#new'
  #post  'occurrence/new', to: 'occurrence#create'

  resources :occurrences, only: [:index, :new, :create]


end
