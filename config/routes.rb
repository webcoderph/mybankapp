Rails.application.routes.draw do
  get 'bank_accounts/index'

  get 'bank_accounts/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#index"

  resources :bank_accounts, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      post "bank_accounts/new_transaction", to: "bank_accounts#new_transaction"
    end
  end
end
