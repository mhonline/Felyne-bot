module FelyneBot
	module Commands
		module Maint
			extend Discordrb::Commands::CommandContainer
			command(:maint) do |event|
				now = Time.now
				now = now.to_i
				time=IO.readlines("bot/maint")[0].to_i
				timediff = time - now - 3600
				if time < now
					event << "Maintenance has ended! GO HUNTING!"
				else
					event << "#{Time.at(timediff).strftime('%H hours %M minutes %S seconds')} left until the end of maint"
				end
			end
		end
	end
end