Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # root to: redirect('/trips')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :trips do
    resources :diary_entries, shallow: true
    resources :checklists, shallow: true
    resources :stops, shallow: true do
      resources :activities, only: [:new, :create, :show, :edit, :update, :destroy], shallow: true do
        member do
          patch :favorite
        end
      end
    end
  end

  resources :checklist_templates do
    resources :checklist_items,  only: [:new, :create, :edit, :update, :destroy], shallow: true do
      resources :items, only: [:new, :create, :edit, :update, :destroy], shallow: true
    end
  end

  # resources :stops, only: [] do
  #   resources :activities, only: [:new, :create]
  # end
  # resources :activities, only: [:edit, :update, :destroy]

  # resources :activities
  # Defines the root path route ("/")
  # root "posts#index"
end
