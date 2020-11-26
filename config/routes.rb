Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :quests, only: [:index, :show, :create, :new, :edit, :update] do
    resources :guilds, only: [:create, :new]
  end
  resources :guilds, only: [:show, :edit, :update] do
    resources :posts, only: [:new, :create] do
      collection do
        get :pistes
      end
      resources :members, only: [:new, :create] do
        get '/accepted', to: 'members#accepted'
        get '/refused', to: 'members#refused'
      end
    end
  end
  resources :posts, only: [:edit, :update] do
    member do
      get :new_avancee_from_post
      post :create_avancee_from_post
    end
  end

end
