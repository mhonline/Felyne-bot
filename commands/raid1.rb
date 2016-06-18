module FelyneBot
	module Commands
		module Raid1
			extend Discordrb::Commands::CommandContainer
			command(:raid1, description: 'Schedules Raid 1. (Name has to be a single word)', usage: '-raid1 <name> <hours> <minutes> | raid1 clear', permission_level: 1, permission_message: "Ask a Mod or Admin to set up a raid!") do |event, name, days, hours, minutes|
				d = days.to_i
				h = hours.to_i
				m = minutes.to_i
				t1 = Time.now
				t2 = t1 + m*60
				t3 = t2 + h*60*60
				t4 = t3 + d*24*60*60
				if name == "clear"
					File.write('bot/raid1', '')
					event << "Raid 1 has been cleared"
				else
					File.write('bot/raid1', name)
					open('bot/raid1', 'a') { |f|
						f.puts "\n#{t4}"
					}
					event << "#{TimeDifference.between(t1, t4)}.in_days until raid"
				end
			end
		end
	end
end