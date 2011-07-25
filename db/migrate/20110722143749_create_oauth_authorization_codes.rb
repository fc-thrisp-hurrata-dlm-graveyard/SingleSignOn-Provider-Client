class CreateOauthAuthorizationCodes < ActiveRecord::Migration
  def self.up
    create_table 'oauth_authorization_codes', :force => true do |t|
      t.integer 'authorization_id', :null => false
      t.string 'code', :null => false
      t.datetime 'expires_at'
      t.datetime 'created_at'
      t.datetime 'updated_at'
      t.string 'redirect_uri'
      #t.timestamps
    end
  end

  def self.down
    drop_table :oauth_authorization_codes
  end
end
