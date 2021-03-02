#json.array! @activities, partial: "activities/activity", as: :activity 
json.array!(current_user.activities) do |activity|
    json.extract! activity, :id
    json.title activity.name
    json.start activity.start_time
    json.end activity.end_time
    json.color activity.category.color
    json.extendedProps do
      json.category activity.category.title
      json.description activity.comment
      json.mastery activity.mastery
      json.pleasure activity.pleasure
    end
    json.url activity_url(activity, format: :html)
  end