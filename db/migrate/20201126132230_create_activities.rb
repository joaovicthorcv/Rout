class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :category
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.float :mastery
      t.float :pleasure
      t.string :comment

      t.timestamps
    end
  end
end
