class HomeController < ApplicationController
  respond_to :html

  def index  
    
    if access_token
      @ok = "ok"
      respond_with @ok
    else
      redirect_to authorize_url
    end
  
  end

  def callback
    response = HTTParty.post(access_token_url, :body => {
    :client_id => CLIENT_ID, 
    :client_secret => CLIENT_SECRET, 
    :redirect_uri => redirect_uri, 
    :code => params["code"],
    :grant_type => 'authorization_code'}
    )

    session[:access_token] = response["access_token"]
    redirect_to account_path
  end

  def account
    if access_token
      @resource_response = get_with_access_token("/account.json")
      session[:user] = @resource_response["current_user"]["user"]["email"]
      session[:user_appwide_key] = @resource_response["current_user"]["user"]["appwide_key"]
      redirect_to root_path
    else
      redirect_to authorize_url
    end
  end

  def logout
    reset_session
    redirect_to RESOURCE_HOST+'/logout'  
  end

private

  CLIENT_ID = 'abcdefgh12345678'
  CLIENT_SECRET = 'secret'
  RESOURCE_HOST = 'http://localhost:3000'

  def redirect_uri
    "http://" + request.host_with_port + "/callback"
  end

  def access_token
    session[:access_token]
  end

  def get_with_access_token(path)
    HTTParty.get(RESOURCE_HOST + path, :query => {:oauth_token => access_token})
  end

  def authorize_url
    RESOURCE_HOST + "/oauth/authorize?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&redirect_uri=#{redirect_uri}"
  end
  
  def access_token_url
    RESOURCE_HOST + "/oauth/access_token"
  end

end
