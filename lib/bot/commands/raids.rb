module MainBot
	module Commands
		module Raids
			extend Discordrb::Commands::CommandContainer
			command(
					:raids,
					description: "Manage raids for channel.",
					usage: "raids <list> <number>",
					help_available: true
			) do |event|
				if $raids.key?(event.channel.id.to_s)
					channelraids = $raids[event.channel.id.to_s]['raids']
					event.channel.send_embed '', list_raids(channelraids, event.channel.name)
				else
					event << "You do not have any raids set right now. Set some with `#{$prefix}newraid`"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: raids"
				nil
			end
		end
	end
end
