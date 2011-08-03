Sso::Application.routes.draw do
  devise_for :users, skip: :registrations
  
  root :to => 'home#index'
  match "/account" => 'home#show'

  scope "/oauth" do
    match "/authorize", :via => :get, :to => "authorization#new"
    match "/authorize", :via => :post, :to => "authorization#create"
  end

end
