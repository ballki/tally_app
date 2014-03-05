class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :logo
      t.string :email
      t.string :street_address
      t.string :phone
      t.string :manager
      t.string :reward
      t.string :req_visits
      t.string :marketing_package
      t.string :photo

      t.timestamps
    end
  end
end
