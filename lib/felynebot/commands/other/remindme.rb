module FelyneBot
	module Commands
		module Remindme
			extend Discordrb::Commands::CommandContainer
			command(
					:remindme,
			) do |event, type, *cron|
				cron = cron.join(' ')
				puts "#{event.timestamp}: #{event.user.name}: CMD: remindme"
				nil
			end
		end
	end
end
