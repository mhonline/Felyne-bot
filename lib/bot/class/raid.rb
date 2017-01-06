class Raid
	def initialize(channelid, array)
		if array[channelid.to_s].any?
			$bot.send_message(channelid, "channel already has an array initialized")
		else
			array[channelid.to_s] = {"raids"=>[ ]}
			$bot.send_message(channelid, "Channel array initialized")
		end
	end
end