class AddUserIdToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :user_id, :string
  end
end
