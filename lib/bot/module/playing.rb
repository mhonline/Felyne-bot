# Adds a role based on who is playing MHO
module Events
  extend Discordrb::EventContainer
  playing do |event|
    server_role = event.server.roles.find do |role|
      role.name == "Playing MHO"
    end
    if event.game == "Monster Hunter Online"
      BOT.user(event.user.id).modify_roles(server_role, nil)
    else
      BOT.user(event.user.id).modify_roles(nil, server_role)
    end
  end
end
