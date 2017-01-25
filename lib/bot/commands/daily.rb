module Commands
  # Command Module
  module Daily
    extend Discordrb::Commands::CommandContainer
    command(
      :daily,
      description: 'Manage Daily reset subscription for channel',
      usage: 'daily <sub/unsub>',
      help_available: true
    ) do |event, option|
      if event.user.can_manage_channels?
        if option == 'sub'
          $daily[event.channel.id.to_s] = true
          event.respond 'You have subscribed this channel to Daily reset news'
        elsif option == 'unsub'
          $daily.delete(event.channel.id.to_s)
          event.respond 'You have unsubscribed this channel from Daily reset news'
        end
        File.open('botfiles/daily.json', 'w') { |f| f.write $daily.to_json }
      else
        event.respond 'Only an admin can subscribe a channel to Daily reset news'
      end
      command_log('daily', event.user.name)
      nil
    end
  end
end
