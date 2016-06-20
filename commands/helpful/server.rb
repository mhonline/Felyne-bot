module FelyneBot
	module Commands
		module Server
			extend Discordrb::Commands::CommandContainer
			command(
					:server,
					description: "Displays a picture of the server most of us play on.",
					useage: "server"
			) do |event|
				event << "http://i.imgur.com/EHqV4Cy.jpg"
				puts "#{event.timestamp}: #{event.user.name}: CMD: server"
				nil
			end
		end
	end
end