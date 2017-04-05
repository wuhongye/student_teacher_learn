Rails.application.routes.draw do

    root 'welcome#index'

    resources :users 

    resources :sessions

    resources :students

    resources :teachers

    resources :students

    resources :teachers

    resources :class_rooms

    namespace :admin do
    root 'users#index'

    resources :users do
      collection do
        get :search
      end
    end
  end
  
end
