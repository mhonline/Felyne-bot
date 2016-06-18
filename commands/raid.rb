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
					#if r1t4.to_i < t1.to_i
					#	raid1 = "```Raid 1:  In process or Completed"
					#else
						raid1 = "```Raid 1:  #{name1} in #{r1d2} days #{r1h2} hours #{r1m2} minutes}"
					#end
				end
				event << "#{raid1}\n"
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