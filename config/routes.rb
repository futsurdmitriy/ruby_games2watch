Rails.application.routes.draw do
  scope path: "/admin" do

    get "games" => "games#index"
    get "games/new" => "games#new"
    get "games/:id/edit" => "games#edit"
    post "games" => "games#create"
    patch "games/:id" => "games#update"
    delete "games/:id" => "games#destroy"

    get "platforms" => "platforms#index"
    get "platforms/new" => "platforms#new"
    get "platforms/:id/edit" => "platforms#edit"
    get "platforms/:id" => "platforms#show"
    post "platforms" => "platforms#create"
    patch "platforms/:id" => "platforms#update"
    delete "platforms/:id" => "platforms#destroy"

    get "modes" => "modes#index"
    get "modes/new" => "modes#new"
    get "modes/:id/edit" => "modes#edit"
    get "modes/:id" => "modes#show"
    post "modes" => "modes#create"
    patch "modes/:id" => "modes#update"
    delete "modes/:id" => "modes#destroy"

    get "requirements" => "requirements#index"
    get "requirements/new" => "requirements#new"
    get "requirements/:id/edit" => "requirements#edit"
    get "requirements/:id" => "requirements#show"
    post "requirements" => "requirements#create"
    patch "requirements/:id" => "requirements#update"
    delete "requirements/:id" => "requirements#destroy"

  end
  get "games/:id" => "games#show"
end
