json.extract! activity, :id, :category, :name, :start_time, :end_time, :mastery, :pleasure, :comment, :created_at, :updated_at
json.url activity_url(activity, format: :json)
