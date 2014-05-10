class Product < ActiveRecord::Base
  belongs_to :category
   attr_accessible :name, :price, :description, :image, :onsale, :category_id
   
  validates_uniqueness_of :name
  validates :name, :price, :description, :category_id, :presence => true

end
