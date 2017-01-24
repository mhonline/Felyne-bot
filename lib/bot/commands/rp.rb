module Commands
  # Command Module
  module RolePlay
    extend Discordrb::Commands::CommandContainer
    command(
      :rp,
      description: 'Nothing to see here.',
      usage: 'rp <text>',
      help_available: false,
      permission_level: 2,
      permission_message: "I'm sorry Dave, I cannot do that."
    ) do |event, *phrase|
      roleplaytext = phrase.join(' ')
      event.respond "sent **#{roleplaytext}** to mhodiscussion"
      BOT.send_message(122526505606709257, roleplaytext)
      command_log('rp', event.user.name)
      nil
    end
  end
end
