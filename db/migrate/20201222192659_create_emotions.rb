class CreateEmotions < ActiveRecord::Migration[6.0]
  def change
    create_table :emotions do |t|
      t.integer :scale
      t.string :feelings
      t.string :trigger
      t.text :thought
      t.string :action

      t.timestamps
    end
  end
end
