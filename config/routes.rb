Rails.application.routes.draw do
  scope path: "/admin" do
    get "games" => "games#index"
    get "games/new" => "games#new"
    get "games/:id/edit" => "games#edit"
    post "games" => "games#create"
    patch "games/:id" => "games#update"
    delete "games/:id" => "games#destroy"
  end
  get "games/:id" => "games#show"
end
