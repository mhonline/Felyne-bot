module FelyneBot
	module Commands
		module Raid2
			extend Discordrb::Commands::CommandContainer
			command(:raid2, permission_level: 1) do |event, name, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				now = Time.now
				now = now.to_i
				targettime = h * 3600 + m * 60 
				targettime += now
				targettime = Time.at (targettime)
				targettime = targettime.to_i
				if name == "clear"
					File.write('bot/raid2', '')
					event << "Raid 2 has been cleared"
				else
					File.write('bot/raid2', name)
					open('bot/raid2', 'a') { |f|
						f.puts "\n#{targettime}"
					}
					event << "#{h} hours #{m} minutes left until '#{name}' raid"
				end
			end
		end
	end
end