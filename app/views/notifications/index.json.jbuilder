json.array!(@notifications) do |notification|
  json.extract! notification, :id, :user_id, :user_id_1, :order_id, :action
  json.url notification_url(notification, format: :json)
end
