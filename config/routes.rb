Rails.application.routes.draw do
  
    
  root 'home#index'

  get   'occurrence/new', to: 'occurrence#new'
  post  'occurrence/new', to: 'occurrence#create'

end
