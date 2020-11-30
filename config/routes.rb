Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/guilds/myguilds', to: 'guilds#show_my_guilds', as: 'myguilds'
  get '/guild/:id/resolved', to: 'guilds#resolved', as: 'quest_resolved'
  post '/guild/:id/resolved', to: 'guilds#resolved'
  resources :quests, only: [:index, :show, :create, :new, :edit, :update] do
    resources :guilds, only: [:create, :new]
  end

  resources :guilds, only: [:show, :edit, :update] do
    resources :posts, only: [:new, :create] do
      collection do
        get :pistes
      end
    end

    resources :members, only: [:new, :create] do
    end
  end

  resources :members, only: [] do
    get :accepted, on: :member
    get :refused, on: :member
  end

  resources :posts, only: [:edit, :update] do
    get :new_avancee_from_post, on: :member
    post :create_avancee_from_post, on: :member
    resources :comments, only: [:create]
  end

end
