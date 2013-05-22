Pestr::Application.routes.draw do
  devise_for :users

  root :to => "dashboard#show"
  resource :dashboard, :only => 'show'

  resources :teams do
    resources :todos
    resources :members
  end

end
