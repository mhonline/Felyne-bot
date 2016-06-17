module FelyneBot
	module Commands
		module Maint
			extend Discordrb::Commands::CommandContainer
			command(:maint) do |event|
now = Time.now.to_i
timediff = $targettime - now
event << "#{Time.at(timediff).strftime('%H hours %M minutes %S seconds')} left until the end of maint"
			end
		end
	end
end