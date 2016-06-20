module FelyneBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(
					:mainsetup,
					description: "Sets time left in maintenance.",
					usage: "mainsetup <hours/clear> <minutes>",
					permission_level: 1,
					permission_message: "Ask a Mod or Admin to set up a Mainenance Timer!"
			) do |event, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				t1 = Time.now
				t2 = t1 + m*60
				t3 = t2 + h*60*60
				h1 = TimeDifference.between(t1, t3).in_hours
				m1 = TimeDifference.between(t1, t3).in_minutes
				h2 = h1.floor
				m1 = m1-60*h2
				m2 = m1.floor
				if name == "clear"
					File.write('bot/maint', '')
					event << "Maintenance has been cleared"
				else
					File.write('bot/maint', t3)
					event << "#{h2} hours #{m2} minutes until the end of maintenance."
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: mainsetup"
				nil
			end
		end
	end
end