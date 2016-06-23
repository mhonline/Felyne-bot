module FelyneBot
	module Commands
		module Avatar
			extend Discordrb::Commands::CommandContainer
			command(
					:avatar,
					description: "Changes avatar randomly",
					useage: "avatar",
					permission_level: 1,
					permission_message: "I'm sorry Dave, I cannot do that."
			) do |event, text|
				picture = 1 + rand(35)
				$bot.profile.avatar = File.open("/pic/#{picture}.jpg")
				role = event.server.roles.find { |role| role.name == "Felyne" }
				newcolor = '0x'
				newcolor << IO.readlines("/bot/colors")[picture]
				newcolor=newcolor.gsub("\n","").hex
				role.color = Discordrb::ColorRGB.new(newcolor)
				$bot.send_message(event.message.channel, "Changing Avatar!")
				puts "#{event.timestamp}: #{event.user.name}: CMD: avatar <#{newcolor}>"
				nil
			end
		end
	end
end