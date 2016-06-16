module FelyneBot
  module Commands
    module Guild
      extend Discordrb::Commands::CommandContainer
      command(:guild, min_args: 0, max_args: 1, description: 'Add user to guild', usage: "-guild <Guildname>", permission_level: 800) do |event, search|
      member = event.user.on(event.server)
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "Hipcheckers" }
		member.add_role(role)
  	    end
      end
    end
  end
end
