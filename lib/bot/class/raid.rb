class Raid
	def initialize(channelid, array)
		if array[channelid.to_s].any?
			$bot.send_message(channelid, "channel already has an array initialized")
		else
			$bot.send_message(channelid, "Array doesn't exist")
		end
	end
end