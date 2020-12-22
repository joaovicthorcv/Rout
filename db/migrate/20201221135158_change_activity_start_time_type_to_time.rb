class ChangeActivityStartTimeTypeToTime < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :start_time, :time
  end
end
