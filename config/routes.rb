AdsMatcher::Application.routes.draw do
  resources :ads_entries
  resource :searches do
    get 'regular'
    get 'sphinx'
    get 'elastic'
  end

  root :to => 'searches#index'
end
