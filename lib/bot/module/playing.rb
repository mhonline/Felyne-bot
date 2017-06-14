# Adds a role based on who is playing MHO
module Events
  extend Discordrb::EventContainer
  playing do |event|
    server_role = event.server.roles.find { |role| role.name == "Playing MHO" }
    puts server_role.id
    if event.game == "Monster Hunter Online"
      # puts event.user.role?(server_role)
      # .add_role(event.server.roles.find { |role| role.name == "Playing MHO" })
    end
  end
end
