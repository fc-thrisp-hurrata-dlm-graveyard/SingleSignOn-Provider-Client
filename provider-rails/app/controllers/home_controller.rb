class HomeController < ApplicationController

  before_filter :authenticate_user!, :except =>[:show]
  before_filter :set_current_account_from_oauth
  
  def index
  end

  def show
    render :json => {:current_user => @current_account}
  end

private

  def set_current_account_from_oauth
    @current_account = request.env['oauth2'].resource_owner
  end

end
