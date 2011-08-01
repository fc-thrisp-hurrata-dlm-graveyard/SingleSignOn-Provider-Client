class User < ActiveRecord::Base
  include RoleModel
  
  validates_presence_of :appwide_key
  before_validation :generate_appwide_key

 
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:recoverable, :rememberable, :trackable, :validatable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :appwide_key
  attr_accessor :roles_mask

  roles_attribute :roles_mask
  roles :admin, :default

  private

    def generate_appwide_key 
      #self.appwide_key = rand(36**10).to_s(36)
      self.appwide_key = rand(36**10).to_s(36) if self.appwide_key.nil?
    end
end
