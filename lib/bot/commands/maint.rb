module Commands
	module Maint
		extend Discordrb::Commands::CommandContainer
		command(
				:maint,
				bucket: :delay300,
				description: "Checks time left in game maintenance.",
				useage: "maint"
		) do |event|
			t1 = Time.now

			t3 = $info['maint']['start']
			unless t3 == nil
				t3 = Time.parse(t3)
				sh1 = TimeDifference.between(t1, t3).in_hours
				sm1 = TimeDifference.between(t1, t3).in_minutes
				sh2 = sh1.floor
				sm1 = sm1-60*sh2
				sm2 = sm1.floor
			end

			t4 = $info['maint']['end']
			unless t4 == nil
				t4 = Time.parse(t4)
				eh1 = TimeDifference.between(t1, t4).in_hours
				em1 = TimeDifference.between(t1, t4).in_minutes
				eh2 = eh1.floor
				em1 = em1-60*eh2
				em2 = em1.floor
			end
			unless t3 == nil
				if t3.past?
					started = "Maintenance has started!"
				else
					started = "#{sh2} hours #{sm2} minutes left until start of maintenance"
				end
			else
				started = "Maintenance start time not set."
			end
			unless t4 == nil
				if t4.past?
					ended = "Maintenance has Ended! GO HUNTING!"
				else
					ended = "#{eh2} hours #{em2} minutes left until end of maintenance"
				end
			else
				ended = "Maintenance end time not set."
			end
			event.respond "```ruby\n#{started}\n#{ended}```"
			puts "#{event.timestamp}: #{event.user.name}: CMD: maint"
			nil
		end
	end
end