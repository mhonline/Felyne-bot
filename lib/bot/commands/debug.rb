module Commands
  # Command Module
  module Notify
    extend Discordrb::Commands::CommandContainer
    command(
      :debug,
      description: 'Toggles debugging',
      usage: 'debug',
      help_available: false,
      permission_level: 800
    ) do |event|
      if $settings.key?('debug')
        if $settings['debug']
          debug = false
          begin
            event.respond 'DEBUG state has been toggled off.'
          rescue
            mute_log(event.channel.id.to_s)
          end
        else
          debug = true
          begin
            event.respond 'DEBUG state has been toggled on.'
          rescue
            mute_log(event.channel.id.to_s)
          end
        end
      else
        debug = true
        begin
          event.respond 'DEBUG state has been toggled on.'
        rescue
          mute_log(event.channel.id.to_s)
        end
      end
      $settings['debug'] = debug
      File.open('botfiles/settings.json', 'w') { |f| f.write $settings.to_json }
      event.message.delete
      command_log('debug', event.user.name)
      nil
    end
  end
end
