Rails.application.routes.draw do
  
  resources :occurrences
  
  root 'home#index'

  get 'occurrence/new'

end
