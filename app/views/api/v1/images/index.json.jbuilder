json.array! @images.each do |image|
  json.id image.id
  json.text image.text
  json.username image.user.name if comment.user
end

