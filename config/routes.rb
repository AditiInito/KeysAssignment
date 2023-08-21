Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root('pages#index')
  # get 'list', to: 'pages#list'
  resources :keys, only: [:index, :destroy, :create] do
    collection do
      post 'random'
    end
    member do
      put 'keys_called_at'
      put 'keys_revived_at'
    end
  end
end