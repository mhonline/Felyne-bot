module FelyneBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(:mainsetup, permission_level: 1) do |event, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				time = h * 3600 + m * 60 + Time.now
				$timecode = Time.parse('time')
				event.respond
				nil
			end
		end
	end
end