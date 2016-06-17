module FelyneBot
	module Commands
		module Maint
			extend Discordrb::Commands::CommandContainer
			command(:maint) do |event|
				targettime=IO.readlines("bot/maint")[0]
				event << targettime
				now = Time.now
				now = now.to_i
				time = targettime.to_i
				event << time
				timediff = targettime - now - 3600
				if time < now
					event << "Maintenance has ended! GO HUNTING!"
				else
					event << "#{Time.at(timediff).strftime('%H hours %M minutes %S seconds')} left until the end of maint"
				end
			end
		end
	end
end