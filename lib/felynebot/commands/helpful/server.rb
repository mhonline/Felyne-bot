module FelyneBot
	module Commands
		module Server
			extend Discordrb::Commands::CommandContainer
			command(
					:server,
					description: "Displays a picture of the server most of us play on.",
					useage: "server"
			) do |event|
				event.respond "https://i.gyazo.com/120e19545d6b56df935fd24617d47001.jpg"
				puts "#{event.timestamp}: #{event.user.name}: CMD: server"
				nil
			end
		end
	end
end
