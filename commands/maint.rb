module FelyneBot
	module Commands
		module Maint
			extend Discordrb::Commands::CommandContainer
			command(:maint, permission_level: 1) do |event, hours, minutes|
timediff = $targettime.to_i - now.to_i
event << "#{Time.at(timediff).strftime('%H hours %M minutes %S seconds')} left until the end of maint"
			end
		end
	end
end