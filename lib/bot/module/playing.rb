# Adds a role based on who is playing MHO
module Events
  extend Discordrb::EventContainer
  playing do |event|
  	puts event.game
  end
end
