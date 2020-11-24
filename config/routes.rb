Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :quests, only: [:index, :show, :create, :new, :edit, :update] do
      resources :guilds, only: [:show, :create, :new, :edit, :update] do
        resources :members, only: [:new, :create]
      end
    end

end
