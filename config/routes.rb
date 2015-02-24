Rails.application.routes.draw do

  root to: 'mood#index'
  get '/load_tracks', to: 'mood#load_tracks'

end
