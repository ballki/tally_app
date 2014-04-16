class ChangeDataFormats2 < ActiveRecord::Migration
  	  def up
   change_column :visits, :customer_id, :integer, "USING CAST(customer_id AS integer)"
  end

  def down
   change_column :visits, :customer_id, :string
  end
  
end
