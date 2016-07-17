module FelyneBot
	module Commands
		module Danger
			extend Discordrb::Commands::CommandContainer
			command(
					:danger,
			) do |event|
				danger = [
					"It sounds like old morse code. ",
					"**Danger, Will Robinson, danger.**",
					"Robot is on-line. Reviewing primary directives. One, preserve the Robinson Family. Two, Maintain ship systems. Three...",
					"**Robot is on-line. Reviewing primary directives. Two hours into mission destroy Robinson family. Destroy all systems.**",
					"Will Robinson! I will tell you a joke! Why did the robot cross the road? Because he was carbon bonded to the chicken!",
					"Oh, ha ha.",
					"*Mom says, get the hell out of there!*",
					"**Destroy Robinson family.**"
				]
				event.respond danger[rand(0..(danger.length-1))]
				puts "#{event.timestamp}: #{event.user.name}: CMD: danger"
				nil
			end
		end
	end
end