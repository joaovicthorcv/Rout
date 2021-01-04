class AddUserIdToEmotions < ActiveRecord::Migration[6.0]
  def change
    add_column :emotions, :user_id, :integer
    add_index :emotions, :user_id
  end
end
