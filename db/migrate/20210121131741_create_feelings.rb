class CreateFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :feelings, if_not_exists: true do |t|
      t.string :name

      t.timestamps
    end
  end
end
