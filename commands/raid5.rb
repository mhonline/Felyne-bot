module FelyneBot
	module Commands
		module Raid5
			extend Discordrb::Commands::CommandContainer
			command(:raid5, description: 'Schedules Raid 5. (Name has to be a single word)', usage: 'raid5 <name> <hours> <minutes>', permission_level: 1) do |event, name, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				now = Time.now
				now = now.to_i
				targettime = h * 3600 + m * 60 
				targettime += now
				targettime = Time.at (targettime)
				targettime = targettime.to_i
				if name == "clear"
					File.write('bot/raid5', '')
					event << "Raid 5 has been cleared"
				else
					File.write('bot/raid5', name)
					open('bot/raid5', 'a') { |f|
						f.puts "\n#{targettime}"
					}
					event << "#{h} hours #{m} minutes left until '#{name}' raid"
				end
			end
		end
	end
end