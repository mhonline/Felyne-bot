module Commands
  # Command Module
  module Eval
    extend Discordrb::Commands::CommandContainer
    command(
      :eval,
      description: 'Evaluates code',
      usage: 'eval <code>',
      help_available: false,
      permission_level: 800
    ) do |event, *code|
      command_log('eval', event.user.name)
      begin
        eval code.join(' ')
      rescue StandardError => e
        event.respond(e.to_s)
      end
    end
  end
end
