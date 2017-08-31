json.id @image.id
json.description @image.description
json.username @image.user.name 
json.comments @image.comments.each do |comment|
  json.id comment.id
  json.text comment.text
  json.username comment.user.name if comment.user
end