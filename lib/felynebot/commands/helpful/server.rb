module FelyneBot
	module Commands
		module Server
			extend Discordrb::Commands::CommandContainer
			command(
					:server,
					bucket: :delay10,
					description: "Displays a picture of the server most of us play on.",
					useage: "server"
			) do |event|
				event.respond "http://i.imgur.com/GDMsGNt.png"
				puts "#{event.timestamp}: #{event.user.name}: CMD: server"
				nil
			end
		end
	end
end
