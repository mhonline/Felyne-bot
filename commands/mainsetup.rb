module FelyneBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(:mainsetup, description: 'Sets time left in maintenance.', usage: '-mainsetup <hours> <minutes> | mainsetup clear', permission_level: 1, permission_message: "Ask a Mod or Admin to set up a Mainenance Timer!") do |event, hours, minutes|
				if hours == 'clear'
					File.write('bot/maint', '')
					event << "Maintenance has been cleared"
				else
					h = hours.to_i
					m = minutes.to_i
					now = Time.now
					now = now.to_i
					targettime = h * 3600 + m * 60 
					targettime += now
					targettime = Time.at (targettime)
					targettime = targettime.to_i
					File.write('bot/maint', targettime)
					event << "#{h} hours #{m} minutes left until the end of maintenance"
				end
			end
		end
	end
end