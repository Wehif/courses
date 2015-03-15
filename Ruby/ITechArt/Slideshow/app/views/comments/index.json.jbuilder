json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_nickname, :body, :album_id
  json.url comment_url(comment, format: :json)
end
