AdsMatcher::Application.routes.draw do
  resources :ads_entries
  resource :searches do
    get 'regular'
    get 'sphinx'
  end

  root :to => 'home#index'
end
