module FelyneBot
	module Commands
		module Achievement
			extend Discordrb::Commands::CommandContainer
			command(
					:achievement,
					bucket: :delay10,
					description: "Shows achievement doc",
					useage: "achievement"
			) do |event|
				event.respond "<https://docs.google.com/spreadsheets/d/1MnP1mzl4HLQ8is29O-hdNs7mbrnjOSlfTl3j5nxYGPM/edit#gid=0>"
				puts "#{event.timestamp}: #{event.user.name}: CMD: achievement"
				nil
			end
		end
	end
end
