Sso::Application.routes.draw do
  devise_for :users

  root :to => 'home#index'

  scope "/oauth" do
    match "/authorize", :via => :get, :to => "authorization#new"
    match "/authorize", :via => :post, :to => "authorization#create"
  end

end
