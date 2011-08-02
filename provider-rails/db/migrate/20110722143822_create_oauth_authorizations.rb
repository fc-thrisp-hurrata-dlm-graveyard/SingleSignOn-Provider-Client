class CreateOauthAuthorizations < ActiveRecord::Migration
  def self.up
   create_table 'oauth_authorizations', :force => true do |t|
      t.integer 'client_id', :null => false
      t.integer 'resource_owner_id'
      t.string 'resource_owner_type'
      t.string 'scope'
      t.datetime 'expires_at'
      #t.timestamps
    end
  end

  def self.down
    drop_table :oauth_authorizations
  end
end
