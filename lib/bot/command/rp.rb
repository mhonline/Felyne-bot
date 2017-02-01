module Commands
  # Command Module
  module RolePlay
    extend Discordrb::Commands::CommandContainer
    command(
      :rp,
      help_available: false,
      permission_level: 10
    ) do |event, *phrase|
      roleplaytext = phrase.join(' ')
      event.respond "sent **#{roleplaytext}** to " +
                    event.server.default_channel.name.to_s
      BOT.send_message(event.server.default_channel.id, roleplaytext)
      command_log('rp', event.user.name)
      nil
    end
  end
end
