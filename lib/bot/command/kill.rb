module Commands
  # Command Module
  module Kill
    extend Discordrb::Commands::CommandContainer
    command(
      :kill,
      description: 'Kills the bot',
      usage: 'kill',
      help_available: false,
      permission_level: 999
    ) do |event|
      begin
        event.respond "Saving data and shutting down... I'll be back."
      rescue
        mute_log(event.channel.id.to_s)
      end
      File.open('botfiles/daily.json', 'w') { |f| f.write $daily.to_json }
      File.open('botfiles/guilds.json', 'w') { |f| f.write $guilds.to_json }
      File.open('botfiles/info.json', 'w') { |f| f.write $info.to_json }
      File.open('botfiles/logs.json', 'w') { |f| f.write $logs.to_json }
      File.open('botfiles/qqnews.json', 'w') { |f| f.write $qqnews.to_json }
      File.open('botfiles/raids.json', 'w') { |f| f.write $raids.to_json }
      File.open('botfiles/settings.json', 'w') { |f| f.write $settings.to_json }
      File.open('botfiles/users.json', 'w') { |f| f.write $users.to_json }
      BOT.stop
      exit
    end
  end
end
