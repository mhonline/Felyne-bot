module FelyneBot
	module Commands
		module Newbie
			extend Discordrb::Commands::CommandContainer
			command(
					:newbie,
					bucket: :delay10,
					description: "Shows newb guide doc",
					useage: "newbie"
			) do |event|
				event.respond "<https://docs.google.com/document/d/1pYPFvTArhaamK3TIfymlolQfnIj0ClKeP3gQcA027x0/edit>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: newbie"
				nil
			end
		end
	end
end
