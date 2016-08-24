module FelyneBot
	module Commands
		module CatVids
			extend Discordrb::Commands::CommandContainer
			command(
					:catvids,
					bucket: :delay10,
					description: "Cat quest videos. (Chinese)",
					useage: "catvids"
			) do |event|
				event.respond "<http://mho.tgbus.com/zt/mmywl/>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: catquest"
				nil
			end
		end
	end
end