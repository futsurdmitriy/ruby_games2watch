Rails.application.routes.draw do
  scope path: "/admin" do

    resources :games
    # get "games" => "games#index"
    # get "games/new" => "games#new"
    # get "games/:id/edit" => "games#edit"
    # post "games" => "games#create"
    # patch "games/:id" => "games#update"
    # delete "games/:id" => "games#destroy"

    resources :platforms
    # get "platforms" => "platforms#index"
    # get "platforms/new" => "platforms#new"
    # get "platforms/:id/edit" => "platforms#edit"
    # get "platforms/:id" => "platforms#show"
    # post "platforms" => "platforms#create"
    # patch "platforms/:id" => "platforms#update"
    # delete "platforms/:id" => "platforms#destroy"

    resources :modes
    # get "modes" => "modes#index"
    # get "modes/new" => "modes#new"
    # get "modes/:id/edit" => "modes#edit"
    # get "modes/:id" => "modes#show"
    # post "modes" => "modes#create"
    # patch "modes/:id" => "modes#update"
    # delete "modes/:id" => "modes#destroy"

    resources :requirements
    # get "requirements" => "requirements#index"
    # get "requirements/new" => "requirements#new"
    # get "requirements/:id/edit" => "requirements#edit"
    # get "requirements/:id" => "requirements#show"
    # post "requirements" => "requirements#create"
    # patch "requirements/:id" => "requirements#update"
    # delete "requirements/:id" => "requirements#destroy"

    resources :users
    # get "users" => "users#index"
    # # get "users/new" => "users#new"
    # get "users/:id/edit" => "users#edit"
    # get "users/:id" => "users#show"
    # patch "users/:id" => "users#update"
    # delete "users/:id" => "users#destroy"

    resources :news
    # get "news" => "news#index"
    # get "news/new" => "news#new"
    # get "news/:id/edit" => "news#edit"
    # get "news/:id" => "news#show"
    # post "news" => "news#create"
    # patch "news/:id" => "news#update"
    # delete "news/:id" => "news#destroy"

  end

  root :to => 'pages#home'
  get "games/:id" => "games#show"
  post "users" => "users#create"
  get "sign-in" => "users#sign_in"
  get "sign-up" => "users#sign_up"

  get "/" => "pages#home"
  get "about-us" => "pages#about_us"
  get "contact-us" => "pages#contact_us"
  resources :sessions, only: [:create]
  get "log-out" => "sessions#destroy"

end
