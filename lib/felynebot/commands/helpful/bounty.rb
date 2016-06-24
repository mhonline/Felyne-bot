module FelyneBot
	module Commands
		module Bounty
			extend Discordrb::Commands::CommandContainer
			command(
					:bounty,
					description: "Bounty picture reference.",
					useage: "bounty"
			) do |event|
				event << "http://i.imgur.com/1zoLPUu.png"
				puts "#{event.timestamp}: #{event.user.name}: CMD: bounty"
				nil
			end
		end
	end
end