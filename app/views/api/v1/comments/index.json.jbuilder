json.array! @comments.each do |comment|
  json.id comment.id
  json.text comment.text
  json.username comment.user.name if comment.user
end

