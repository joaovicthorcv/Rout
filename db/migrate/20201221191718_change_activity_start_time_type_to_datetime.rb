class ChangeActivityStartTimeTypeToDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :start_time, 'timestamptz using start_time::timestamptz'
  end
end
