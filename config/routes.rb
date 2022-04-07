Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests, shallow: true do
    resources :questions do
      resources :answers, except: :index
    end
    # resources :questions
  end

  # GET /passed_test/999/result
  resources :passed_test, only: %i[show update] do
    member do
      get :result
    end
  end
end
