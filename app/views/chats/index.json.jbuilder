json.chats @chats do |chat|
  json.id chat.id
  json.name chat.name
  json.creator chat.user.username
  if chat.messages.last
    json.last_message do
      json.content chat.messages.last.content
      json.creator chat.messages.last.user.username
    end

  else
      json.last_message chat.messages.last
  end
end
