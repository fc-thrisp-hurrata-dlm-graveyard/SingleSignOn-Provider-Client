class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_account
    @current_account ||= session[:current_account] && User.find_by_email(session[:current_account])
  end

end
