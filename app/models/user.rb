class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :providers_attributes
  has_many :providers, :class_name => "UserProvider", :dependent => :destroy
  has_many :talks
  accepts_nested_attributes_for :providers
  authenticates_with_sorcery!
  has_many :comments
  acts_as_voter

  #admin moderator author banned

  def is?(required_role)    
    roles.find_index(required_role) <= roles.find_index(role)
  end

  def role=(role)
    super(role) if roles.include? role
  end


  private

  def roles
    @roles ||= ['banned','authenticated','admin']
  end
  #validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  #validates_confirmation_of :password, :message => "should match confirmation", :if => :password
end
