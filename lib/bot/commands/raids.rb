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
				if File.file?("botfiles/raids/#{event.channel.id}")
					channelraids = loadArr(channelraids,"botfiles/raids/#{event.channel.id}")
					
					output = "```ruby\n"
					x = 0
					y = 1
					begin
						output += "Reminder #{y}: #{channelraids[x+1]} @ #{channelraids[x]}\n"
						x += 2
						y += 1
					end while x < channelraids.length
					output += "```"
					event << output

				else
					event << "You do not have any raids set right now. Set some with `#{$prefix}newraid`"
				end

				File.write("botfiles/raids/#{event.channel.id}", channelraids)

				puts "#{event.timestamp}: #{event.user.name}: CMD: raids"
				nil
			end
		end
	end
end
