class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!
  #before_filter :authenticate_admin!

  
  def current_account
    @current_account ||= session[:current_account] && User.find_by_email(session[:current_account])
  end

  #session[:current_account] = current_user.email

  #def current_account
  #  @current_account ||= session[:account_id] && Account.find_by_id(session[:account_id])
  #end

end
