module FelyneBot
	module Commands
		module Reset
			extend Discordrb::Commands::CommandContainer
			command(:reset) do |event|
				t2 = Time.now.to_i
				t1 = Time.parse("20:00").to_i
				if t1 > t2 then event << "#{Time.at(t1 - t2).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next ticket reset"
				else event << "#{Time.at(t1 + 86400 - t2).strftime('**%H** hours **%M** minutes **%S** seconds')} left until the next ticket reset" end
				puts "#{event.timestamp}: #{event.user.name}: -reset"
			end
		end
	end
end