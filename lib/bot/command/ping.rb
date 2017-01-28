module Commands
  # Command Module
  module Ping
    extend Discordrb::Commands::CommandContainer
    command(
      :ping,
      description: 'Responds with response time',
      usage: 'ping',
      help_available: false
    ) do |event|
      begin
        event.respond "Pong! : #{((Time.now - event.timestamp) * 1000).to_i}ms"
      rescue
        mute_log(event.channel.id.to_s)
      end
      command_log('ping', event.user.name)
      nil
    end
  end
end
