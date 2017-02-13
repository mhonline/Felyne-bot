module Commands
  # Command Module
  module Notify
    extend Discordrb::Commands::CommandContainer
    command(
      :debug,
      description: 'Toggles debugging',
      usage: 'debug',
      help_available: false,
      permission_level: 999
    ) do |event|
      if $settings.key?('debug')
        if $settings['debug']
          debug = false
          m = 'DEBUG state has been toggled off.'
        else
          debug = true
          m = 'DEBUG state has been toggled on.'
        end
      else
        debug = true
        m = 'DEBUG state has been toggled on.'
      end
      $settings['debug'] = debug
      File.open('botfiles/settings.json', 'w') { |f| f.write $settings.to_json }
      event.message.delete
      command_log('debug', event.user.name)
      m
    end
  end
end
