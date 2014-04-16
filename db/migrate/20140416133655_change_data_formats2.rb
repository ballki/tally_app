class ChangeDataFormats2 < ActiveRecord::Migration
  	  def up
   change_column :visits, :customer_id, :integer
  end

  def down
   change_column :visits, :customer_id, :string
  end
  
end
