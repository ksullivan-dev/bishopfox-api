Rails.application.routes.draw do
  resources :import
  root 'nmap#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
