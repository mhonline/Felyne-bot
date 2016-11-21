module FelyneBot
	module Commands
		module Remindme
			extend Discordrb::Commands::CommandContainer
			command(
					:remindme,
					min_args: 1,
					max_args: 1,
					description: "Sets user up for PM notification of events.",
					usage: "remindme <daily/weekend>",
			) do |event, type|
				if type = "daily" || type = "weekend" || type = "remove"
					if type = "daily"
						if File.file?("bot/dailypm")
							dailypm = loadArr(dailypm,"bot/dailypm")
						else
							dailypm = []
						end
						if dailypm.include? event.user.id
							event << "You are already recieving daily pm notifications"
						else
							dailypm = dailypm.push(event.user.id)
							File.write('bot/dailypm', weekendpm.to_s)
							event << "*#{event.user.name}* has been added to the daily pm list"
						end
					end
					if type = "weekend"
						if File.file?("bot/weekendpm")
							weekendpm = loadArr(weekendpm,"bot/weekendpm")
						else
							weekendpm = []
						end
						if weekendpm.include? event.user.id
							event << "You are already recieving weekend pm notifications"
						else
							weekendpm = weekendpm.push(event.user.id)
							File.write('bot/weekendpm', weekendpm.to_s)
							event << "*#{event.user.name}* has been added to the weekend event pm list"
						end
					end
					if type = "remove"
						if File.file?("bot/dailypm")
							dailypm = loadArr(dailypm,"bot/dailypm")
						else
							dailypm = []
						end
						if dailypm.include? event.user.id
							dailypm = dailypm - event.user.id
							File.write('bot/dailypm', dailypm.to_s)
							event << "You have been removed from the daily notifications list"
						else
							event << "You are not currently recieving daily notifications"
						end
						if File.file?("bot/weekendpm")
							weekendpm = loadArr(weekendpm,"bot/weekendpm")
						else
							weekendpm = []
						end
						if weekendpm.include? event.user.id
							weekendpm = weekendpm - event.user.id
							File.write('bot/weekendpm', weekendpm.to_s)
							event << "You have been removed from the weekend notifications list"
						else
							event << "You are not currently recieving weekend notifications"
						end
				else
					event << "Invalid.  Valid options: `daily` | `weekend` | `remove`"
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: remindme <#{type}>"
				nil
			end
		end
	end
end
