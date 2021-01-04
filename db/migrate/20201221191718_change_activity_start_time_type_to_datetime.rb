class ChangeActivityStartTimeTypeToDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :start_time, "datetime using ('2021-1-1'::date + start_time::timestamptz)"
  end
end
