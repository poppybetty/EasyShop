class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :title, :string
      t.column :firstname, :string
      t.column :lastname, :string
      t.column :email, :string
      t.column :password, :string
      t.column :address1, :string
      t.column :address2, :string
      t.column :address3, :string
      t.column :postal_code, :string
      t.column :cellphone, :string
      t.timestamps
    end
  end
end
