class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :business_id
      t.string :customer_id

      t.timestamps
    end
  end
end
