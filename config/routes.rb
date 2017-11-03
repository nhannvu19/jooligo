Rails.application.routes.draw do
  get 'admin/administrator'

  mount Ckeditor::Engine => "/ckeditor"
  
 
  mount ActionCable.server => "/cable"

  get '/guides/select'
  get '/guides/maps'
  get '/users/sign_in'

  # Controller POST
  resources :posts, only: [:new, :index, :create, :show]
  get 'posts/censored/:id' => 'posts#censored'
  get 'posts/uncensored/:id' => 'posts#uncensored'
  # Controller ADMIN
  get 'admin/sign_out'
  get 'admin/register'
  get 'admin/sign_in'
  post 'admin/login'
end
