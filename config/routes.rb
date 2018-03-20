Rails.application.routes.draw do
  get "/auth/github", as: :github_login
  resources :dashboard, only: [:index]
end
