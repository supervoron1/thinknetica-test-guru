Rails.application.routes.draw do
  # get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  # get :signup, to: 'users#new'
  # get :login, to: 'sessions#new'
  # delete :logout, to: 'sessions#destroy'
  #
  # resources :users, only: :create
  # resources :sessions, only: :create

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  # GET /passed_test/999/result
  resources :passed_test, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: %i[index]
    resources :tests, shallow: true do
      patch :update_inline, on: :member

      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end

    resources :badges, only: %i[new index create destroy]
  end

  resources :feedbacks, only: %i[new create]
  resources :badges, only: :index do
    get :user_badges, on: :collection
  end
end
