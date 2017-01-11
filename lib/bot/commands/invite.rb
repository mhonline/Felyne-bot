module Commands
	module Invite
		extend Discordrb::Commands::CommandContainer
		command(
				:invite,
				description: "Invites bot to your server",
				useage: "invite"
		) do |event|
			event.respond  "Invite Link: <#{$bot.invite_url}>"
			puts "#{event.timestamp}: #{event.user.name}: CMD: invite"
			nil
		end
	end
end
