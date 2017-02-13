module Commands
  # Command Module
  module Ping
    extend Discordrb::Commands::CommandContainer
    command(
      [:ping, :p],
      description: 'Responds with response time',
      usage: 'ping',
      help_available: false
    ) do |event|
      command_log('ping', event.user.name)
      "Pong! : #{((Time.now - event.timestamp) * 1000).to_i}ms"
    end
  end
end
