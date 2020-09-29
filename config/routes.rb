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
  end
  get "games/:id" => "games#show"
end
