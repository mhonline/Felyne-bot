module FelyneBot
	module Commands
		module Raid1
			extend Discordrb::Commands::CommandContainer
			command(:raid1, permission_level: 1) do |event, name, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				now = Time.now
				now = now.to_i
				targettime = h * 3600 + m * 60 
				targettime += now
				targettime = Time.at (targettime)
				targettime = targettime.to_i
				#write to file
				File.write('bot/raid1', name')
				open('bot/raid1', 'a') { |f|
					f.puts "\n#{targettime}"
				}
				event << "#{h} hours #{m} minutes left until '#{name}' raid"
			end
		end
	end
end