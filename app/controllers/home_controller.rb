class HomeController < ApplicationController
  #before_filter :authenticate_user!
  #authenticate_with_oauth  #, :except => [:index]
  #before_filter :set_current_account_from_oauth

  #respond_to :html, :json
  #include OAuth2::Provider::Rack::AuthorizationCodesSupport

  before_filter :authenticate_user!, :except =>[:show]
  before_filter :set_current_account_from_oauth
  #before_filter :handle_authorization_code_grant_type
  #before_filter :block_invalid_authorization_code_requests
  #before_filter :regrant_existing_authorizations
  
  def index
    if current_user.has_role? :admin
      #show user page
    else
      # show blank page 
    end
  end

  def show
    render :json => {:current_user => @current_account}
  end

private

  def set_current_account_from_oauth
    @current_account = request.env['oauth2'].resource_owner
  end

end
