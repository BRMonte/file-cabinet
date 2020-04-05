Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  root 'welcome#index' #when user IS NOT logged in: will be sent to this route/view

  authenticated :user do
    root "docs#index", as: "authenticated_root" #when user logged in: will be sent to this route/view
  end

  resources :docs

end
