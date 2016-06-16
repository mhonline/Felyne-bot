module FelyneBot
  module Commands
    module Game
      extend Discordrb::Commands::CommandContainer
      command(:game, description: 'Sets game status of the bot.', usage: 'game <text>', min_args: 1, permission_level: 800) do |event, *text|
        $bot.game = text.join(' ')
        nil
      end
    end
  end
end
