class ChangeActivityStartTimeTypeToDatetime < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :start_time, "timestamptz using ('2021-1-1'::date + start_time)"
  end
end
