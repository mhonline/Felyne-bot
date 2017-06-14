# Adds a role based on who is playing MHO
module Events
  extend Discordrb::EventContainer
  playing do |event|
    begin
      server_role = event.server.roles.find do |role|
        role.name == "Playing MHO"
      end
      if event.game == "Monster Hunter Online"
        event.user.add_role(server_role)
      else
        event.user.remove_role(server_role)
      end
    rescue
    end
  end
end
