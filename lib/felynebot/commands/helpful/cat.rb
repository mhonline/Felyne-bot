module FelyneBot
	module Commands
		module Cat
			extend Discordrb::Commands::CommandContainer
			command(
					:cat,
					bucket: :delay10,
					description: "Shows cat doc",
					useage: "cat"
			) do |event|
				event.respond "<https://drive.google.com/open?id=1Ynk9jhza6R9enhmNw2-8pUwtuHDfkPx3cm98ZYW3oA0>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: cat"
				nil
			end
		end
	end
end
