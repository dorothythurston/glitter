json.array! @activities do |activity|
  json.user_id activity.user_id
  json.type activity.type
  json.subject_id activity.subject_id
  json.subject_type activity.subject_type
  json.actor_id activity.actor_id
  json.target_id activity.target_id
  json.target_type activity.target_type
  json.created_at activity.created_at
end
