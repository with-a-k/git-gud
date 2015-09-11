Rails.application.routes.draw do
  root 'landing#show'
  
  get '/auth/github/callback', to: 'sessions#create'
  get '/feed', to: 'feed#show'
  get '/logout', to: 'sessions#destroy'
  get '/you', to: 'you#show'
end
