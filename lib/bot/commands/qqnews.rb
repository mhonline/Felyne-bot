module Commands
  # Command Module
  module Qqnews
    extend Discordrb::Commands::CommandContainer
    command(
      :qqnews,
      description: 'Manage QQ News subscription for channel.',
      usage: 'qqnews <sub/unsub>',
      help_available: true
    ) do |event, option|
      if event.user.can_manage_channels?
        if option == 'sub'
          $qqnews[event.channel.id.to_s] = true
          event << 'You have subscribed this channel to QQ MHO news'
        elsif option == 'unsub'
          $qqnews.delete(event.channel.id.to_s)
          event << 'You have unsubscribed this channel from QQ MHO news'
        end
        File.open('botfiles/qqnews.json', 'w') { |f| f.write $qqnews.to_json }
      else
        event << 'Only an admin can subscribe a channel to QQ MHO news'
      end
      command_log('qqnews', event.user.name)
      nil
    end
  end
end
