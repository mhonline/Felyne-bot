module Commands
  # Command Module
  module RolePlay
    extend Discordrb::Commands::CommandContainer
    command(
      [:roleplay, :rp],
      help_available: false,
      permission_level: 10
    ) do |event, *phrase|
      roleplaytext = phrase.join(' ')
      BOT.send_message(event.server.default_channel.id, roleplaytext)
      command_log('rp', event.user.name)
      "sent **#{roleplaytext}** to " + event.server.default_channel.name.to_s
    end
  end
end
