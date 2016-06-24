module FelyneBot
	module Commands
		module Damage
			extend Discordrb::Commands::CommandContainer
			command(
					:damage,
					description: "Damage copypasta for ref.",
					useage: "damage"
			) do |event|
				event << "```Normal/Rapid UP    7% \nPellet/Scatter UP     7% \nPierce UP                  20% \nUnscathed                7% \nAdrenaline +2          10% \nAdrenaline +3          30% \nChallenger +1          4% \nChallenger +2          7% \nWeakness Exploit   5%```"
				puts "#{event.timestamp}: #{event.user.name}: CMD: damage"
				nil
			end
		end
	end
end