Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :quests, only: [:index, :show, :create, :new, :edit, :update] do
    resources :guilds, only: [:create, :new]
    resources :posts, only: [:edit, :update]
  end
  resources :guilds, only: [:show, :edit, :update] do
    resources :posts, only: [:new, :create]
    resources :members, only: [:new, :create] do
      get '/accepted', to: 'members#accepted'
      get '/refused', to: 'members#refused'
    end
  end

end
