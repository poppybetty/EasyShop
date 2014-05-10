class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :price, :float
      t.column :description, :text
      t.column :onsale, :boolean, :default => false
      t.column :category_id, :integer
      t.column :image, :string
    end
  end
end
