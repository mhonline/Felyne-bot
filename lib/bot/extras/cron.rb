def cronjobs_start
	scheduler = Rufus::Scheduler.new

	unless File.exist?("botfiles/raids")
		Dir.mkdir("botfiles/raids")
	end
	
	scheduler.every '10s' do
		clock=Time.new
		puts "[#{clock.inspect}] Checking for raids"

		Dir["botfiles/raids/*"].each { |file| 

			channel = file
			channel.slice! "botfiles/raids/"
			puts ">Loading raids for: #{channel}"
			raids = loadArr(raids,"botfiles/raids/#{channel}")
			pos = 0
			begin
				t4 = raids[pos]
				t4 = Time.parse(t4)
				if t4.past?
					channeltest = $bot.channel channel
					channeltest = channeltest.to_s
					if channeltest != ""
						$bot.send_message(channel, "Raid for #{raids[pos+1]}")
					end
					puts ">    Posting raid to #{channel}! Deleting reminder!"
					raids.delete_at(pos+1)
					raids.delete_at(pos)
					pos -= 2
				end
				pos += 2
			end while pos < raids.length

			if raids.length == 0
				File.delete("botfiles/raids/#{channel}")
				puts ">        No more raids exist for #{channel}! Deleting file!"
			else
				File.write("botfiles/raids/#{channel}", raids)
			end
		}
	end

	scheduler.cron '5 */3 * * *' do
		$bot.stop
	end
	puts 'Cron jobs scheduled!'
end