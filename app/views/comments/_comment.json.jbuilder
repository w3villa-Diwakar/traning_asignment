json.extract! comment, :id, :content, :commentable_id, :commentable_type, :user, :created_at, :updated_at
json.url comment_url(comment, format: :json)
