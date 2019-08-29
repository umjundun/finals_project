json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.full_name
  json.action notification.action
  json.notifiable do
    json.type "a #{notification.notifiable.class.to_s.downcase}"
  end
  json.url user_engagement_path(current_user, notification.notifiable)
end
