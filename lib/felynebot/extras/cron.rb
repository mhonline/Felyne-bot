def cronjobs_start
	scheduler = Rufus::Scheduler.new
	scheduler.cron '0 19 * * 1' do
		$bot.send_message(122526505606709257, "Daily gift/ticket reset just happened!\nArena, Cat Quest, and Raid limits have been reset\nWeekly shop limits have been reset\nDon't forget to collect your rewards!")
		$bot.send_message(125859373393117184, "Daily gift/ticket reset just happened!\nArena, Cat Quest, and Raid limits have been reset\nWeekly shop limits have been reset\nDon't forget to collect your rewards!")
		if File.file?("bot/dailypm")
			dailypm = loadArr(dailypm,"bot/dailypm")
		else
			dailypm = []
		end
		dailypm.each { |x| $bot.user(x).pm("Daily gift/ticket reset just happened!\nArena, Cat Quest, and Raid limits have been reset\nWeekly shop limits have been reset\nDon't forget to collect your rewards!")}
	end
	scheduler.cron '0 19 * * 2' do
		$bot.send_message(122526505606709257, "Daily gift/ticket reset just happened!\nHS Point allocation points have been reset\nDon't forget to collect your rewards!")
		$bot.send_message(125859373393117184, "Daily gift/ticket reset just happened!\nHS Point allocation points have been reset\nDon't forget to collect your rewards!")
		if File.file?("bot/dailypm")
			dailypm = loadArr(dailypm,"bot/dailypm")
		else
			dailypm = []
		end
		dailypm.each { |x| $bot.user(x).pm("Daily gift/ticket reset just happened!\nHS Point allocation points have been reset\nDon't forget to collect your rewards!")}
	end
	scheduler.cron '0 19 * * 3' do
		$bot.send_message(122526505606709257, "Weekly gift/ticket reset just happened!\nYour extra ticket storage has been refilled!\nAny weekly events such as Astrolab have been reset!\nDon't forget to collect your rewards!")
		$bot.send_message(125859373393117184, "Weekly gift/ticket reset just happened!\nYour extra ticket storage has been refilled!\nAny weekly events such as Astrolab have been reset!\nDon't forget to collect your rewards!")
		if File.file?("bot/dailypm")
			dailypm = loadArr(dailypm,"bot/dailypm")
		else
			dailypm = []
		end
		dailypm.each { |x| $bot.user(x).pm("Weekly gift/ticket reset just happened!\nYour extra ticket storage has been refilled!\nAny weekly events such as Astrolab have been reset!\nDon't forget to collect your rewards!")}
	end
	scheduler.cron '0 19 * * 4,5,6' do
		$bot.send_message(122526505606709257, "Daily gift/ticket reset just happened!\nDon't forget to collect your rewards!")
		$bot.send_message(125859373393117184, "Daily gift/ticket reset just happened!\nDon't forget to collect your rewards!")
		if File.file?("bot/dailypm")
			dailypm = loadArr(dailypm,"bot/dailypm")
		else
			dailypm = []
		end
		dailypm.each { |x| $bot.user(x).pm("Daily gift/ticket reset just happened!\nDon't forget to collect your rewards!")}
	end
	scheduler.cron '0 19 * * 7' do
		$bot.send_message(122526505606709257, "Daily gift/ticket reset just happened!\nWeekly Achievements have been reset\nDon't forget to collect your rewards!")
		$bot.send_message(125859373393117184, "Daily gift/ticket reset just happened!\nWeekly Achievements have been reset\nDon't forget to collect your rewards!")
		if File.file?("bot/dailypm")
			dailypm = loadArr(dailypm,"bot/dailypm")
		else
			dailypm = []
		end
		dailypm.each { |x| $bot.user(x).pm("Daily gift/ticket reset just happened!\nWeekly Achievements have been reset\nDon't forget to collect your rewards!")}
	end
	scheduler.cron '0 11 * * 6' do
		$bot.send_message(122526505606709257, "Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")
		$bot.send_message(125859373393117184, "Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")
		if File.file?("bot/weekendpm")
			weekendpm = loadArr(weekendpm,"bot/weekendpm")
		else
			weekendpm = []
		end
		weekendpm.each { |x| $bot.user(x).pm("Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")}
	end
	scheduler.cron '0 11 * * 7' do
		$bot.send_message(122526505606709257, "Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")
		$bot.send_message(125859373393117184, "Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")
		if File.file?("bot/weekendpm")
			weekendpm = loadArr(weekendpm,"bot/weekendpm")
		else
			weekendpm = []
		end
		weekendpm.each { |x| $bot.user(x).pm("Don't forget to set your computer timezone to Beijing, China and log in to get your tickets. Event starts in 1 hour")}
	end
	scheduler.cron '5 */3 * * *' do
		$bot.stop
	end
	puts 'Cron jobs scheduled!'
end