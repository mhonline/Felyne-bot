module Commands
  # Command Module
  module Qqnews
    extend Discordrb::Commands::CommandContainer
    command(
      :qqnews,
      description: 'Manage QQ News subscription for channel.',
      usage: 'qqnews <sub/unsub>',
      min_args: 1,
      help_available: true,
      required_permissions: [:manage_channels],
      permission_message: 'Only a channel manager can use %name%'
    ) do |event, option|
      if option == 'sub'
        $qqnews[event.channel.id.to_s] = true
        m = 'You have subscribed this channel to QQ MHO news'
      elsif option == 'unsub'
        $qqnews.delete(event.channel.id.to_s)
        m = 'You have unsubscribed this channel from QQ MHO news'
      end
      File.open('botfiles/qqnews.json', 'w') { |f| f.write $qqnews.to_json }
      command_log('qqnews', event.user.name)
      m
    end
  end
end
