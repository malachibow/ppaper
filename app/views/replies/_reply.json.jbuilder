json.extract! reply, :id, :post_id, :user_id, :report, :created_at, :updated_at
json.url reply_url(reply, format: :json)
