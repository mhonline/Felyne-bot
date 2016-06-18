module FelyneBot
	module Commands
		module Raid3
			extend Discordrb::Commands::CommandContainer
			command(:raid3, description: 'Schedules Raid 3. (Name has to be a single word)', usage: '-raid3 <name> <hours> <minutes> | raid3 clear', permission_level: 1, permission_message: "Ask a Mod or Admin to set up a raid!") do |event, name, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				now = Time.now
				now = now.to_i
				targettime = h * 3600 + m * 60 
				targettime += now
				targettime = Time.at (targettime)
				targettime = targettime.to_i
				if name == "clear"
					File.write('bot/raid3', '')
					event << "Raid 3 has been cleared"
				else
					File.write('bot/raid3', name)
					open('bot/raid3', 'a') { |f|
						f.puts "\n#{targettime}"
					}
					event << "#{h} hours #{m} minutes left until '#{name}' raid"
				end
			end
		end
	end
end