def cronjobs_start
	scheduler = Rufus::Scheduler.new
	
	scheduler.every '10s' do
		clock=Time.new
		$raids.each do |key, array|
			y = 0
			begin
				begin
					t4 = array['raids'][y]['time']
					t4 = Time.parse(t4)
					if t4.past?
						$bot.send_message(key, "Raid for #{array['raids'][y]['name']}")
						$raids[key.to_s]['raids'].delete_at(y)
						y -= 1
					end
				rescue
					$raids.delete(key)
				end
					y += 1
			end while y < array['raids'].length
		end
		File.open('botfiles/raids.json', 'w') { |f| f.write $raids.to_json }
	end

	scheduler.cron '0 19 * * 1' do
		$daily.each do |key, array|
			$bot.send_message(key, "Daily gift/ticket reset just happened!\nArena, Cat Quest, and Raid limits have been reset\nWeekly shop limits have been reset\nDon't forget to collect your rewards!")
		end
	end

	scheduler.cron '0 19 * * 2' do
		$daily.each do |key, array|
			$bot.send_message(key, "Daily gift/ticket reset just happened!\nHS Point allocation points have been reset\nDon't forget to collect your rewards!")
		end
	end

	scheduler.cron '0 19 * * 3' do
		$daily.each do |key, array|
			$bot.send_message(key, "Weekly gift/ticket reset just happened!\nYour extra ticket storage has been refilled!\nAny weekly events such as Astrolab have been reset!\nDon't forget to collect your rewards!")
		end
	end

	scheduler.cron '0 19 * * 4,5,6' do
		$daily.each do |key, array|
			$bot.send_message(key, "Daily gift/ticket reset just happened!\nDon't forget to collect your rewards!")
		end
	end

	scheduler.cron '0 19 * * 7' do
		$daily.each do |key, array|
			$bot.send_message(key, "Daily gift/ticket reset just happened!\nWeekly Achievements have been reset\nDon't forget to collect your rewards!")
		end
	end

	scheduler.cron '5 */3 * * *' do
		$bot.stop
	end
	puts 'Cron jobs scheduled!'
end