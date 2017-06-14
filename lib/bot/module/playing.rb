# Adds a role based on who is playing MHO
module Events
  extend Discordrb::EventContainer
  playing do |event|
    if event.game == "Monster Hunter Online"
      event.user.add_role(event.server.roles.find { |role| role.name == "Playing MHO" })
    end
  end
end
