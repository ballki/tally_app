class ChangeDataFormats < ActiveRecord::Migration
  	  def up
   change_column :visits, :business_id, :integer
  end

  def down
   change_column :visits, :business_id, :string
  end
  
end
