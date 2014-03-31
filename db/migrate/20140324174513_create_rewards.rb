class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.string :business_id
      t.string :customer_id
      t.string :reward
      t.boolean :redeemed
      t.datetime :redeemed_at

      t.timestamps
    end
  end
end
