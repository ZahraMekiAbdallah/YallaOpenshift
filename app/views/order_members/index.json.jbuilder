json.array!(@order_members) do |order_member|
  json.extract! order_member, :id, :user_id, :order_id, :joined
  json.url order_member_url(order_member, format: :json)
end
