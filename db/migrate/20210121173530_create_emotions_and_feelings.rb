class CreateEmotionsAndFeelings < ActiveRecord::Migration[6.0]
  def change
    create_table :emotions_feelings do |t|
      t.belongs_to :feeling
      t.belongs_to :emotion
    end
  end
end
