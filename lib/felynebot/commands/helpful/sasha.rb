module FelyneBot
	module Commands
		module Sasha
			extend Discordrb::Commands::CommandContainer
			command(
					:sasha,
					description: "Sasha quests quick ref.",
					useage: "sasha"
			) do |event|
				event.respond "http://i.imgur.com/ZPbqWpd.png"
				puts "#{event.timestamp}: #{event.user.name}: CMD: sasha"
				nil
			end
		end
	end
end
