class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles do |t|
      t.column :user_id, :integer
      t.column :role_id, :integer
    end
    
    # Static create roles   
    Role.create(:name => "admin", :description => "Administrator's role")
    Role.create(:name => "customer", :description => "Customer's role")
    User.create(:firstname => "Admin", :lastname => "Admin", :email => "admin@easyshop.co.za", :password => "1234")
    User.create(:firstname => "Customer", :lastname => "Customer", :email => "customer@easyshop.co.za", :password => "1234")
  end
end
