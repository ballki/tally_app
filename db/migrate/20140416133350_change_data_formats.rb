class ChangeDataFormats < ActiveRecord::Migration
  	  def up
   change_column :visits, :business_id, :integer, "USING CAST(business_id AS integer)"
  end

  def down
   change_column :visits, :business_id, :string
  end
  
end
