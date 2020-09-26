Rails.application.routes.draw do
  scope path: "/admin" do
    get "games" => "games#index"
    get "games/new" => "games#new"
  end
end
