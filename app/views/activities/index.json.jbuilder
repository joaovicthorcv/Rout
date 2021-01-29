#json.array! @activities, partial: "activities/activity", as: :activity 
json.array!(@activities) do |activity|
    json.extract! activity, :id
    json.title activity.name
    json.description activity.comment
    json.start activity.start_time
    json.end activity.end_time
    json.url activity_url(activity, format: :html)
  end