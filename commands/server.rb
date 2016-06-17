module FelyneBot
	module Commands
		module Server
			extend Discordrb::Commands::CommandContainer
			command(:server) do |event|
				event << "http://i.imgur.com/EHqV4Cy.jpg"
				puts "#{event.timestamp}: #{event.user.name}: [server]"
				nil
			end
		end
	end
end