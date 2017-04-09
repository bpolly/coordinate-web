json.chat_id @chat.id
json.creator @chat.user.username
json.messages @chat.messages do |message|
  json.id message.id
  json.content message.content
  json.username message.user.username
  json.timestamp message.created_at
end
