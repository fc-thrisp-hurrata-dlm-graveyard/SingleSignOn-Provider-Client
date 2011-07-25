class CreateOauthAccessTokens < ActiveRecord::Migration
  def self.up
    create_table 'oauth_access_tokens', :force => true do |t|
      t.integer 'authorization_id', :null => false
      t.string 'access_token', :null => false
      t.string 'refresh_token'
      t.datetime 'expires_at'
      t.datetime 'created_at'
      t.datetime 'updated_at'

      #t.timestamps
    end
  end

  def self.down
    drop_table :oauth_access_tokens
  end
end
