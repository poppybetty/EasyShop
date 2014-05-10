class Category < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  
   attr_accessible :name, :description
  
  validates_uniqueness_of :name
  validates :name, :description, :presence => true

 
end
