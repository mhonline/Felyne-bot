module FelyneBot
  module Commands
    module Kill
      extend Discordrb::Commands::CommandContainer
      command(:kill, description: "Kills felyne", permission_level: 800) do |event|
        puts "Daisy... daisy, give me your answer do..."
        bot.send_message(event.message.channel, "Daisy... daisy, give me your answer do...")
        #bot.stop
        exit
      end
    end
  end
end
