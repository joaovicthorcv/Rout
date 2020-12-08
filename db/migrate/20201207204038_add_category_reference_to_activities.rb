class AddCategoryReferenceToActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :activities, :category
  end
end
