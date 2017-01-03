module MainBot
	module Commands
		module Newraid
			extend Discordrb::Commands::CommandContainer
			command(
					:newraid,
					description: "Sets a raid reminder for the channel.",
					usage: "remindme <days> <hours> <mins> <text>",
					help_available: true,
					permission_level: 1,
					min_args: 4,
					permission_message: "Ask a Mod or Admin to set up a raid!"
					
			) do |event, days, hours, minutes, *text|
				channelname = event.channel.name
				if channelname.include? "raid"
					if (days.to_i + hours.to_i) == 0 && minutes.to_i < 60
						event << "You can't set up a raid with less than an hour until start! Nobody would even show up!"
					else
						raidtext = text.join(' ')

						d = days.to_i
						h = hours.to_i
						h1 = hours.to_i - 1
						m = minutes.to_i
						m15 = minutes.to_i - 15
						m30 = minutes.to_i - 30
						m45 = minutes.to_i - 45
						t1 = Time.now
						t2 = t1 + m*60
						t3 = t2 + h*60*60
						tactual = t3 + d*24*60*60
						t2 = t1 + m15*60
						t3 = t2 + h*60*60
						t15 = t3 + d*24*60*60
						t2 = t1 + m30*60
						t3 = t2 + h*60*60
						t30 = t3 + d*24*60*60
						t2 = t1 + m45*60
						t3 = t2 + h*60*60
						t45 = t3 + d*24*60*60
						t2 = t1 + m*60
						t3 = t2 + h1*60*60
						t60 = t3 + d*24*60*60
						
						unless File.exist?("botfiles/raids")
							Dir.mkdir("botfiles/raids")
						end

						if File.file?("botfiles/raids/#{event.channel.id}")
							channelraids = loadArr(channelraids,"botfiles/raids/#{event.channel.id}")
							channelraids.push(tactual.to_s, "#{raidtext.to_s} is starting now!")
							channelraids.push(t15.to_s, "#{raidtext.to_s} is starting in 15 minutes!")
							channelraids.push(t30.to_s, "#{raidtext.to_s} is starting in 30 minutes!")
							channelraids.push(t45.to_s, "#{raidtext.to_s} is starting in 45 minutes!")
							channelraids.push(t60.to_s, "#{raidtext.to_s} is starting in 1 hour!")
							raidsnum = channelraids.length.to_i / 2
							event << "Raid set up!" 
						else
							channelraids = [tactual.to_s, "#{raidtext.to_s} is starting now!", t15.to_s, "#{raidtext.to_s} is starting in 15 minutes!", t30.to_s, "#{raidtext.to_s} is starting in 30 minutes!", t45.to_s, "#{raidtext.to_s} is starting in 45 minutes!", t60.to_s, "#{raidtext.to_s} is starting in 1 hour!"]
							event << "Raid set up!"
						end

						File.write("botfiles/raids/#{event.channel.id}", channelraids)
					end
				else
					event << "This is not a raid channel.  You can only setup raid reminders for channels with raid in the name."
				end
				puts "#{event.timestamp}: #{event.user.name}: CMD: newraid"
				nil
			end
		end
	end
end
