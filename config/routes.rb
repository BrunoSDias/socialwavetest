Rails.application.routes.draw do
  get 'admin/index'

  namespace :admin do
    get 'login/index'
    post '/login/index', to: 'login#logar'
    get '/deslogar', to: 'login#deslogar'
    resources :ingressos
    resources :pedidos, except: [:new, :create, :edit, :update]
    resources :compradors
  end

  get 'login/index'
  post '/login/index', to: 'login#logar'
  get '/deslogar', to: 'login#deslogar'  

  root 'home#index'

  resources :pedidos, except: [:index, :show]
  resources :compradors, except: [:index]

end
