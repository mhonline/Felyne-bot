module FelyneBot
	module Commands
		module Raid
			extend Discordrb::Commands::CommandContainer
			command(:raid, description: 'Displays raid schedule.') do |event, list|
				t1 = Time.now
				name1=IO.readlines("bot/raid1")[0]
				name2=IO.readlines("bot/raid2")[0]
				name3=IO.readlines("bot/raid3")[0]
				name4=IO.readlines("bot/raid4")[0]
				name5=IO.readlines("bot/raid5")[0]
				if name1.to_s == ''
					raid1 = "```Raid 1:  Nothing set up"
				else
					name1=name1.gsub("\n","")
					r1t4=IO.readlines("bot/raid1")[1]
					r1d1 = TimeDifference.between(t1, r1t4).in_days
					r1h1 = TimeDifference.between(t1, r1t4).in_hours
					r1m1 = TimeDifference.between(t1, r1t4).in_minutes
					r1d2 = r1d1.floor
					r1h1 = r1h1-24*r1d2
					r1h2 = r1h1.floor
					r1m1 = r1m1-60*r1h2-24*60*r1d2
					r1m2 = r1m1.floor
					if time1.to_i < now.to_i
						raid1 = "```Raid 1:  In process or Completed"
					else
						raid1 = "```Raid 1:  #{name1} in #{d2} days #{h2} hours #{m2} minutes}"
					end
				end
				if name2.to_s == ''
					raid2 = "Raid 2:  Nothing set up"
				else
					name2=name2.gsub("\n","")
					time2=IO.readlines("bot/raid2")[1].to_i
					timediff2 = time2 - now - 3600
					if time2 < now
						raid2 = "Raid 2:  In process or Completed"
					else
						raid2 = "Raid 2:  #{name2} in #{Time.at(timediff2).strftime('%d Days %H hours %M minutes %S seconds')}"
					end
				end
				if name3.to_s == ''
					raid3 = "Raid 3:  Nothing set up"
				else
					name3=name3.gsub("\n","")
					time3=IO.readlines("bot/raid3")[1].to_i
					timediff3 = time3 - now - 3600
					if time3 < now
						raid3 = "Raid 3:  In process or Completed"
					else
						raid3 = "Raid 3:  #{name3} in #{Time.at(timediff3).strftime('%d Days %H hours %M minutes %S seconds')}"
					end
				end
				if name4.to_s == ''
					raid4 = "Raid 4:  Nothing set up"
				else
					name4=name4.gsub("\n","")
					time4=IO.readlines("bot/raid4")[1].to_i
					timediff4 = time4 - now - 3600
					if time4 < now
						raid4 = "Raid 4:  In process or Completed"
					else
						raid4 = "Raid 4:  #{name4} in #{Time.at(timediff4).strftime('%d Days %H hours %M minutes %S seconds')}"
					end
				end
				if name5.to_s == ''
					raid5 = "Raid 5:  Nothing set up```"
				else
					name5=name5.gsub("\n","")
					time5=IO.readlines("bot/raid5")[1].to_i
					timediff5 = time5 - now - 3600
					if time5 < now
						raid5 = "Raid 5:  In process or Completed```"
					else
						raid5 = "Raid 5:  #{name5} in #{Time.at(timediff5).strftime('%d Days %H hours %M minutes %S seconds')}```"
					end
				end
				event << "#{raid1}\n#{raid2}\n#{raid3}\n#{raid4}\n#{raid5}"
				if list == 'ready'
					role = event.server.roles.find { |role| role.name == "RaidReady" }.id
					raidready = event.server.members.select { |m| m.role?(role) }
					i=0
					raidusers = ""
					while i < raidready.length
						raidusers << "**#{raidready[i].username}**\n"
						i+=1
					end
					event << raidusers
					event << "#{raidready.length} users are ready to raid"
				end
			end
		end
	end
end