class ChangeDataFormats3 < ActiveRecord::Migration
  	  def up
   change_column :rewards, :business_id, :integer, "USING CAST(business_id AS integer)"
      change_column :rewards, :customer_id, :integer, "USING CAST(customer_id AS integer)"
  end

  def down
   change_column :rewards, :business_id, :string
      change_column :rewards, :customer_id, :string
  end
  
end
