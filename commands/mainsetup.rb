module FelyneBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(:mainsetup, permission_level: 1) do |event, hours, minutes|
h = hours.to_i
h = h * 3600
m = minutes.to_i
m = m * 60
now = Time.now
now = now.to_i
timediff = h + m 
timediff = Time.at (timediff)
event << "#{h} hours #{m} minutes left until the end of maintenance"
event << timediff
event << timenow
end
		end
	end
end