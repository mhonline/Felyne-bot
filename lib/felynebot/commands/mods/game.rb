module FelyneBot
	module Commands
		module Game
			extend Discordrb::Commands::CommandContainer
			command(
					:game,
					description: "Sets game status of the bot.",
					usage: "game <text>",
					min_args: 1,
					permission_level: 800,
					permission_message: "I'm sorry Dave, I cannot do that."
			) do |event, *text|
				gametext = text.join(' ')
				File.write('/bot/game', gametext)
				$bot.game = gametext
				puts "#{event.timestamp}: #{event.user.name}: CMD: game <#{gametext}>"
				nil
			end
		end
	end
end