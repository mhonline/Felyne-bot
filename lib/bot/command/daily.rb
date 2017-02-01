module Commands
  # Command Module
  module Daily
    extend Discordrb::Commands::CommandContainer
    command(
      :daily,
      description: 'Manage Daily reset subscription for channel',
      usage: 'daily <sub/unsub>',
      help_available: true,
      required_permissions: 4,
      permission_message: 'Only a channel manager can use %name%'
    ) do |event, option|
      if option == 'sub'
        $daily[event.channel.id.to_s] = true
        event.respond 'You have subscribed this channel to Daily reset news'
      elsif option == 'unsub'
        $daily.delete(event.channel.id.to_s)
        event.respond 'You have unsubscribed this channel from Daily reset ' \
                      'news'
      end
      File.open('botfiles/daily.json', 'w') { |f| f.write $daily.to_json }
      command_log('daily', event.user.name)
      nil
    end
  end
end
