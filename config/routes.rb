Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  # devise_for :posts
  resources :posts
  mount API::Base, at: "/"

  # get '#path', to: 'homepage#index', via: :all
    
    

end


