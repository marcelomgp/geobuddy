Rails.application.routes.draw do
  
    
  root to: 'occurrences#index'

  #get   'occurrence/new', to: 'occurrence#new'
  #post  'occurrence/new', to: 'occurrence#create'

  post 'occurrences/bbox', to: 'occurrences#bbox'

  resources :occurrences, only: [:index, :new, :create]


end
