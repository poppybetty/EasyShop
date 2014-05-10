class Role < ActiveRecord::Base
   attr_accessible :name, :description
   
   has_many :users_roles
   has_many :users, :through => :users_roles
  
  def self.admin
    Role.first(:conditions => "name='admin'")
  end
  
  def self.customer
     Role.first(:conditions => "name='customer'")
  end
end
