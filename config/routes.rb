Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :quests, only: [:index, :show, :create, :new, :edit, :update] do
      resources :guild, only: [:show, :create, :new, :edit, :update]
    end

end
