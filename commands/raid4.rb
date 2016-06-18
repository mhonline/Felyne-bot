module FelyneBot
	module Commands
		module Raid4
			extend Discordrb::Commands::CommandContainer
			command(:raid4, description: 'Schedules Raid 4. (Name has to be a single word)', usage: '-raid4 <name> <hours> <minutes> | raid4 clear', permission_level: 1, permission_message: "Ask a Mod or Admin to set up a raid!") do |event, name, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				now = Time.now
				now = now.to_i
				targettime = h * 3600 + m * 60 
				targettime += now
				targettime = Time.at (targettime)
				targettime = targettime.to_i
				if name == "clear"
					File.write('bot/raid4', '')
					event << "Raid 4 has been cleared"
				else
					File.write('bot/raid4', name)
					open('bot/raid4', 'a') { |f|
						f.puts "\n#{targettime}"
					}
					event << "#{h} hours #{m} minutes left until '#{name}' raid"
				end
			end
		end
	end
end