module FelyneBot
	module Commands
		module Avatar
			extend Discordrb::Commands::CommandContainer
			command(:avatar, description: "Changes avatar randomly", permission_level: 1) do |event, text|
				picture = 1 + rand(35)
				$bot.profile.avatar = File.open("/Felyne-bot/pic/#{picture}.jpg")
				role = event.server.roles.find { |role| role.name == "Felyne" }
				newcolor = '0x'
				newcolor << IO.readlines("bot/colors")[picture]
				newcolor=newcolor.gsub("\n","").hex
				role.color = Discordrb::ColorRGB.new(newcolor)
				$bot.send_message(event.message.channel, "Changing Avatar!")
				puts "Changing Avatar"
				nil
			end
		end
	end
end