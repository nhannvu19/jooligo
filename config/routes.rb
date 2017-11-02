Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"

  get '/guides/select'
  get '/guides/maps'
  get '/users/sign_in'
end
