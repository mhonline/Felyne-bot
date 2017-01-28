# Deletes message based on emoji response
module Events
  extend Discordrb::EventContainer
  reaction_add(emoji: "\u274C") do |event|
    next unless event.emoji.name == "\u274C"
    next unless event.message.from_bot?
    event.message.delete
  end
end
