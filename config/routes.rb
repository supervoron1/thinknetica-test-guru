Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  resources :tests, shallow: true do
    resources :questions do
      resources :answers
    end
    # resources :questions
  end
end
