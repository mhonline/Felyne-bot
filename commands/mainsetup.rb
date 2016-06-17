module FelyneBot
	module Commands
		module MainSetup
			extend Discordrb::Commands::CommandContainer
			command(:mainsetup, permission_level: 1) do |event, hours, minutes|
				h = hours.to_i
				m = minutes.to_i
				t1 = Time.now
				t1 = t1.to_i
				time = h * 3600 + m * 60
				nowtime = Time.now
				nowtime = t1.to_i
				nowtime += time
				timecode = Time.at(timecode)
				event << "#{Time.at(t3).strftime('%H hours %M minutes %S seconds')} left until the next exp/gift reset"
				nil
			end
		end
	end
end