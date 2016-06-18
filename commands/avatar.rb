module FelyneBot
	module Commands
		module Avatar
			extend Discordrb::Commands::CommandContainer
			command(:avatar, description: "Changes avatar randomly", permission_level: 1) do |event|
				$bot.profile.avatar = File.open("/Felyne-bot/pic/#{1 + rand(35)}.jpg")
				role = event.server.roles.find { |role| role.name == "Felyne" }
				role.color = Discordrb::ColorRGB.new(0xffffff)
				$bot.send_message(event.message.channel, "Changing Avatar!")
				puts "Changing Avatar"
				nil
			end
		end
	end
end