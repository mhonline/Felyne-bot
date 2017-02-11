module Commands
  # Command Module
  module Eval
    extend Discordrb::Commands::CommandContainer
    command(
      [:eval, :e],
      description: 'Evaluates code',
      usage: 'eval <code>',
      help_available: false,
      permission_level: 999
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
