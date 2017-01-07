module MainBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(
					:mainsetup,
					description: "Sets time left in maintenance.",
					usage: "mainsetup <start/end> <hours/clear> <minutes>",
					permission_level: 2,
					min_args: 2,
					max_args: 3,
					permission_message: "Ask a Mod or Admin to set up a Mainenance Timer!"
			) do |event, option, hours, minutes|
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
				if option == "start"
					if hours == "clear"
						File.write('botfiles/maintstart', '')
						event.respond "Maintenance has been cleared"
					else
						File.write('botfiles/maintstart', t3)
						event.respond "#{h2} hours #{m2} minutes until the start of maintenance."
					end
				end
				if option == "end"
					if hours == "clear"
						File.write('botfiles/maintend', '')
						event.respond "Maintenance has been cleared"
					else
						File.write('botfiles/maintend', t3)
						event.respond "#{h2} hours #{m2} minutes until the end of maintenance."
					end
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: mainsetup <#{option}> <#{t3}>"
				nil
			end
		end
	end
end