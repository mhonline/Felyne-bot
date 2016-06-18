module FelyneBot
	module Commands
		module Server47
			extend Discordrb::Commands::CommandContainer
			command(:server47, description: 'Displays a picture of the server 4-7.') do |event|
				event << "https://i.imgur.com/W3tv2c8.jpg"
				puts "#{event.timestamp}: #{event.user.name}: [server4-7]"
				nil
			end
		end
	end
end