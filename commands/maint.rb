module FelyneBot
	module Commands
		module Maint
			extend Discordrb::Commands::CommandContainer
			command(:maint) do |event|
now = Time.now
now = now.to_i
targettime = $targettime.to_i
timediff = now - targettime
event << "#{Time.at(timediff).strftime('%H hours %M minutes %S seconds')} left until the end of maint"
			end
		end
	end
end