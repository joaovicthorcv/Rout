class ActivitySerializer < ActiveModel::Serializer
    attributes :id, :user_id, :category_id, :name, :start_time, :end_time, :mastery, :pleasure, :comment
 end