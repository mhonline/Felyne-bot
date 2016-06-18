module FelyneBot
	module Commands
		module Color
			extend Discordrb::Commands::CommandContainer
			command(:color, description: "Changes avatar randomly", permission_level: 1) do |event|
				$bot.profile.avatar = File.open("/Felyne-bot/pic/#{1 + rand(35)}.jpg")
				role = event.server.roles.find { |role| role.name == "Felyne" }
				RoleWriter.role.update_role(color: e44a02)
				$bot.send_message(event.message.channel, "Changing Avatar!")
				puts "Changing Avatar"
				nil
			end
		end
	end
end