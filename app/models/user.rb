class User < ActiveRecord::Base
   attr_accessible :title, :firstname, :lastname, :email, :password, :address1, :address2,  :address3, :postal_code, :cellphone
   before_create :add_role
   has_many :orders
   has_many :users_roles
   has_many :roles, :through => :users_roles
   
   # Validations
   validates_uniqueness_of :email
   validates :firstname, :lastname, :email, :presence => true
   
   TITLE = ["Mr","Mrs","Miss"]
   
   def add_user!     
      # Save user
      save
   end
   
   def add_role
     # Add customer role
     _role = User.first ? "customer" : "admin"
     roles << Role.find(:all, :conditions => ["name='#{_role}'"])
   end
 
   def self.try_to_logig(username, password)
     User.first(:conditions => ["email =? AND password=?",username,password])
   end
 
   def presentation_name
     self[:firstname].to_s + ""+ self[:lastname].to_s
   end
end
