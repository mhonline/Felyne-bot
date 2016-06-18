module FelyneBot
	module Commands
		module Raid
			extend Discordrb::Commands::CommandContainer
			command(:raid, description: 'Displays raid schedule.') do |event, list|
				t1 = Time.now

				#Get raid names from file
				name1 = IO.readlines("bot/raid1")[0]
				name2 = IO.readlines("bot/raid2")[0]
				name3 = IO.readlines("bot/raid3")[0]
				name4 = IO.readlines("bot/raid4")[0]
				name5 = IO.readlines("bot/raid5")[0]

				#Raid 1
				if name1.to_s == ''	#checks if raid exists
					raid1 = "```Raid 1:  Nothing set up"	#if it doesn't sets text
				else
					name1 = name1.gsub("\n","")	#removes new line from string in file
					r1t4 = IO.readlines("bot/raid1")[1]	#gets date/time from file
					r1t4 = Time.parse(r1t4.gsub("\n",""))	#parses string as time without the new line
					r1d1 = TimeDifference.between(t1, r1t4).in_days	#gets time diff in days
					r1h1 = TimeDifference.between(t1, r1t4).in_hours	#gets time diff in hours
					r1m1 = TimeDifference.between(t1, r1t4).in_minutes	#gets time diff in minutes
					r1d2 = r1d1.floor	#rounds days down
					r1h1 = r1h1 - 24 * r1d2	#subtracts days from hours
					r1h2 = r1h1.floor #rounds remaining hours down
					r1m1 = r1m1 - 60 * r1h2 - 24 * 60 * r1d2	#subtracts hours and days from minutes
					r1m2 = r1m1.floor	#rounds remaining minutes down
					if r1t4.past?	#checks if date is in the past
						raid1 = "```Raid 1:  In process or Completed"	#if it is raid is complete
					else
						raid1 = "```Raid 1:  #{name1} in #{r1d2} days #{r1h2} hours #{r1m2} minutes"	#if it isn't display time left
					end
				end

				#Raid 2
				if name2.to_s == ''
					raid2 = "Raid 2:  Nothing set up"
				else
					name2 = name2.gsub("\n","")
					r2t4 = IO.readlines("bot/raid2")[1]
					r2t4 = Time.parse(r2t4.gsub("\n",""))
					r2d1 = TimeDifference.between(t1, r2t4).in_days
					r2h1 = TimeDifference.between(t1, r2t4).in_hours
					r2m1 = TimeDifference.between(t1, r2t4).in_minutes
					r2d2 = r2d1.floor
					r2h1 = r2h1 - 24 * r2d2
					r2h2 = r2h1.floor
					r2m1 = r2m1 - 60 * r2h2 - 24 * 60 * r2d2
					r2m2 = r2m1.floor
					if r2t4.past?
						raid2 = "Raid 2:  In process or Completed"
					else
						raid2 = "Raid 2:  #{name2} in #{r2d2} days #{r2h2} hours #{r2m2} minutes"
					end
				end

				#Raid 3
				if name3.to_s == ''
					raid3 = "Raid 3:  Nothing set up"
				else
					name3 = name3.gsub("\n","")
					r3t4 = IO.readlines("bot/raid3")[1]
					r3t4 = Time.parse(r3t4.gsub("\n",""))
					r3d1 = TimeDifference.between(t1, r3t4).in_days
					r3h1 = TimeDifference.between(t1, r3t4).in_hours
					r3m1 = TimeDifference.between(t1, r3t4).in_minutes
					r3d2 = r3d1.floor
					r3h1 = r3h1 - 24 * r3d2
					r3h2 = r3h1.floor
					r3m1 = r3m1 - 60 * r3h2 - 24 * 60 * r3d2
					r3m2 = r3m1.floor
					if r3t4.past?
						raid3 = "Raid 3:  In process or Completed"
					else
						raid3 = "Raid 3:  #{name3} in #{r3d2} days #{r3h2} hours #{r3m2} minutes"
					end
				end

				#Raid 4
				if name4.to_s == ''
					raid4 = "Raid 4:  Nothing set up"
				else
					name4 = name4.gsub("\n","")
					r4t4 = IO.readlines("bot/raid4")[1]
					r4t4 = Time.parse(r4t4.gsub("\n",""))
					r4d1 = TimeDifference.between(t1, r4t4).in_days
					r4h1 = TimeDifference.between(t1, r4t4).in_hours
					r4m1 = TimeDifference.between(t1, r4t4).in_minutes
					r4d2 = r4d1.floor
					r4h1 = r4h1 - 24 * r4d2
					r4h2 = r4h1.floor
					r4m1 = r4m1 - 60 * r4h2 - 24 * 60 * r4d2
					r4m2 = r4m1.floor
					if r4t4.past?
						raid4 = "Raid 4:  In process or Completed"
					else
						raid4 = "Raid 4:  #{name4} in #{r4d2} days #{r4h2} hours #{r4m2} minutes"
					end
				end

				#Raid 5
				if name5.to_s == ''
					raid5 = "Raid 5:  Nothing set up```"
				else
					name5 = name5.gsub("\n","")
					r5t4 = IO.readlines("bot/raid5")[1]
					r5t4 = Time.parse(r5t4.gsub("\n",""))
					r5d1 = TimeDifference.between(t1, r5t4).in_days
					r5h1 = TimeDifference.between(t1, r5t4).in_hours
					r5m1 = TimeDifference.between(t1, r5t4).in_minutes
					r5d2 = r5d1.floor
					r5h1 = r5h1 - 24 * r5d2
					r5h2 = r5h1.floor
					r5m1 = r5m1 - 60 * r5h2 - 24 * 60 * r5d2
					r5m2 = r5m1.floor
					if r5t4.past?
						raid5 = "Raid 5:  In process or Completed```"
					else
						raid5 = "Raid 5:  #{name5} in #{r5d2} days #{r5h2} hours #{r5m2} minutes```"
					end
				end

				#put strings in event
				event << "#{raid1}\n#{raid2}\n#{raid3}\n#{raid4}\n#{raid5}"
				if list == 'ready'
					role = event.server.roles.find { |role| role.name == "RaidReady" }.id
					raidready = event.server.members.select { |m| m.role?(role) }
					i = 0
					raidusers = ""
					while i < raidready.length
						raidusers << "**#{raidready[i].username}**\n"
						i += 1
					end
					event << raidusers
					event << "#{raidready.length} users are ready to raid"
				end
			end
		end
	end
end