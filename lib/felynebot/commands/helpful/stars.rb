module FelyneBot
	module Commands
		module Stars
			extend Discordrb::Commands::CommandContainer
			command(
					:stars,
					description: "Stars picture list.",
					useage: "stars"
			) do |event|
				event.respond "https://imgur.com/a/eemCL"
				puts "#{event.timestamp}: #{event.user.name}: CMD: stars"
				nil
			end
		end
	end
end