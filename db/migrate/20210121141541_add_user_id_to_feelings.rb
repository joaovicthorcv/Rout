class AddUserIdToFeelings < ActiveRecord::Migration[6.0]
  def change
    add_column :feelings, :user_id, :integer
    add_index :feelings, :user_id
  end
end
