module FelyneBot
	module Commands
		module Helix
			extend Discordrb::Commands::CommandContainer
			command(
					:helix,
					description: "Helix's Wild Hunts",
					useage: "helix"
			) do |event|
				event.respond "https://www.youtube.com/watch?v=Xl8Xmndhl-0&list=PLhNtuAoh_D8cX_CC7aHJW7RvgfWpE7lba"
				puts "#{event.timestamp}: #{event.user.name}: CMD: helix"
				nil
			end
		end
	end
end