module FelyneBot
	module Commands
		module Blog
			extend Discordrb::Commands::CommandContainer
			command(
					:blog,
					description: "Hunter Blog quick ref.",
					useage: "blog"
			) do |event|
				event << "<https://docs.google.com/document/d/12vYXsxwvRM1yMEwkASS79wzvgCm89SPYHQfu4BK3kCc/pub>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: blog"
				nil
			end
		end
	end
end