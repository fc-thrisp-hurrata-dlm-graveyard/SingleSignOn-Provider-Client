class AuthorizationController < ApplicationController
  include OAuth2::Provider::Rack::AuthorizationCodesSupport

  before_filter :authenticate_user!
  before_filter :block_invalid_authorization_code_requests
  before_filter :regrant_existing_authorizations

  def new
    session[:current_account] = current_user.email
    @client = oauth2_authorization_request.client
    grant_authorization_code(current_user)
  end

  #def create
    #if params[:commit] == "Yes"
      #grant_authorization_code(current_user)
    #else
      #deny_authorization_code
    #end
  #end

private

  def regrant_existing_authorization
    oauth2_authorization_request.grant_existing! current_user
  end

end
