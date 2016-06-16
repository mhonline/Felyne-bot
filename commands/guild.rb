module FelyneBot
  module Commands
    module Guild
      extend Discordrb::Commands::CommandContainer
      command(:guild, min_args: 0, max_args: 1, description: 'Add user to guild', usage: "-guild <Guildname>", permission_level: 800) do |event, search|
      member = event.user.on(event.server)
	    if search == null
	    $bot.send_message(event.message.channel, "Guilds on server: Hipcheckers, Hyperlynx, Stygian, MHOInter, Discord, SG★Hunters, 血盟狩猎团, 月夜黑貓團, 为卿负天下、, Abysswalker, thelegionnaires, GatotKaca, LaTaverne, MooGoo")
	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "Hipcheckers" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "Hyperlynx" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "Stygian" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "MHOInter" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "Discord" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "SG★Hunters" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "血盟狩猎团" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "月夜黑貓團" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "为卿负天下、" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "Abysswalker" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "thelegionnaires" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "GatotKaca" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "LaTaverne" }
		member.add_role(role)
  	    end
	    if search == 'Hipcheckers'
	    role = event.server.roles.find { |role| role.name == "MooGoo" }
		member.add_role(role)
  	    end
      end
    end
  end
end
