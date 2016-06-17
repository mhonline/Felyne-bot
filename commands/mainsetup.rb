module FelyneBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(:mainsetup, permission_level: 1) do |event, hours, minutes|
h = hours.to_i
m = minutes.to_i
maint = h * 3600 + m * 60
t = Time.now
nowtime = t.to_i
nowtime += maint
timecode = Time.parse(nowtime)
event << "#{Time.at(timecode).strftime('%H hours %M minutes %S seconds')} left until the next exp/gift reset"
end
		end
	end
end