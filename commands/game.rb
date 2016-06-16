module FelyneBot
  module Commands
    module Game
      extend Discordrb::Commands::CommandContainer
      command(:game, permission_level: 1, description: 'Sets game status of the bot.',
                     usage: 'game <text>', min_args: 1) do |event, *text|
        event.bot.game = text.join(' ') 
      end
    end
  end
end
