class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :business_id
      t.integer :customer_id
      t.string :reward
      t.boolean :redeemed
      t.datetime :redeemed_at

      t.timestamps
    end
  end
end
