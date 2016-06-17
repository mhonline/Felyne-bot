module FelyneBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(:mainsetup, permission_level: 1) do |event, hours, minutes|
h = hours.to_i
m = minutes.to_i
time = h * 3600 + m * 60
t = Time.now
nowtime = t.to_i
nowtime += time
timecode = Time.at(nowtime)
event << "#{Time.at(nowtime).strftime('%H hours %M minutes %S seconds')} left until the next exp/gift reset"
end
		end
	end
end