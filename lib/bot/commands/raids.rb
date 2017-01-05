module MainBot
	module Commands
		module Raids
			extend Discordrb::Commands::CommandContainer
			command(
					:raids,
					description: "Manage raids for channel.",
					usage: "raids <list|delete> <number>",
					help_available: true
			) do |event, option, number|
				if File.file?("botfiles/raids/#{event.channel.id}")
					begin
						channelraids = loadArr(channelraids,"botfiles/raids/#{event.channel.id}")
					rescue

					end
					if option == "list"
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
					elsif option == "delete"
						if number == "all"
							File.delete("botfiles/raids/#{userid}")
						else
							channelraids.delete_at((number.to_i-1)*2+1)
							channelraids.delete_at((number.to_i-1)*2)
							File.write("botfiles/raids/#{event.channel.id}", channelraids)
							event << "Raid reminder was deleted"
						end
					else
						raidnum = channelraids.length.to_i / 2
						event << "You have #{raidnum} raid reminders set! Use the list option to list them or the delete option to delete one"
					end

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
