Rails.application.routes.draw do
  scope path: "/admin" do
    get "games" => "games#index"
    get "games/new" => "games#new"
    post "games" => "games#create"
  end
end
