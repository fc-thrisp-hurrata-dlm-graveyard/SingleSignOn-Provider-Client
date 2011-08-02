class CreateOauthClients < ActiveRecord::Migration
  def self.up
    create_table 'oauth_clients', :force => true do |t|
      t.string 'name'
      t.string 'oauth_identifier', :null => false
      t.string 'oauth_secret', :null => false
      t.string 'oauth_redirect_uri'
      t.timestamps
    end
  end

  def self.down
    drop_table :oauth_clients
  end
end
