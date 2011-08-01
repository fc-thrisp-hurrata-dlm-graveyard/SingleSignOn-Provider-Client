class Backend::ApplicationController < ActionController::Base
  protect_from_forgery
  # obviously not secure
  #http_basic_authenticate_with name: "frodo", password: "thering"
end
