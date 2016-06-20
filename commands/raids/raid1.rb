module FelyneBot
	module Commands
		module Raid1
			extend Discordrb::Commands::CommandContainer
			command(
					:raid1,
					description: "Schedules Raid 1. (Name has to be a single word)",
					usage: "raid1 <name/clear> <days> <hours> <minutes>",
					permission_level: 1,
					permission_message: "Ask a Mod or Admin to set up a raid!"
			) do |event, name, days, hours, minutes|
				d = days.to_i
				h = hours.to_i
				m = minutes.to_i
				t1 = Time.now
				t2 = t1 + m*60
				t3 = t2 + h*60*60
				t4 = t3 + d*24*60*60
				d1 = TimeDifference.between(t1, t4).in_days
				h1 = TimeDifference.between(t1, t4).in_hours
				m1 = TimeDifference.between(t1, t4).in_minutes
				d2 = d1.floor
				h1 = h1-24*d2
				h2 = h1.floor
				m1 = m1-60*h2-24*60*d2
				m2 = m1.floor
				if name == "clear"
					File.write('bot/raid1', '')
					event << "Raid 1 has been cleared"
				else
					File.write('bot/raid1', name)
					open('bot/raid1', 'a') { |f|
						f.puts "\n#{t4}"
					}
					event << "#{d2} days #{h2} hours #{m2} minutes until #{name} raid"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: raid1"
			end
		end
	end
end