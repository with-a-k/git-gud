Rails.application.routes.draw do
  root 'landing#show'
  
  get '/auth/github/callback', to: 'sessions#create'
  get '/feed', to: 'feed#show'
  get '/logout', to: 'sessions#destroy'
end
