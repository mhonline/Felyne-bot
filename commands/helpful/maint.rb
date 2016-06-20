module FelyneBot
	module Commands
		module Maint
			extend Discordrb::Commands::CommandContainer
			command(
					:maint,
					description: "Checks time left in game maintenance.",
					useage: "maint"
			) do |event|
				t3 = IO.readlines("bot/maint")[0]
				t3 = Time.parse(t3.gsub("\n",""))
				t1 = Time.now
				h1 = TimeDifference.between(t1, t3).in_hours
				m1 = TimeDifference.between(t1, t3).in_minutes
				h2 = h1.floor
				m1 = m1-60*h2
				m2 = m1.floor
				if t3.past?
						event << "Maintenance has ended! GO HUNTING!"
					else
						event << "#{h2} hours #{m2} minutes left until end of maintenance"
					end
				end
				puts '#{event.timestamp}: #{event.user.name}: CMD: maint'
				nil
			end
		end
	end
end