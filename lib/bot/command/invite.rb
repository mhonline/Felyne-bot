module Commands
  # Command Module
  module Invite
    extend Discordrb::Commands::CommandContainer
    command(
      :invite,
      description: 'Shows the invite link for the bot',
      usage: 'invite'
    ) do |event|
      command_log('invite', event.user.name)
      "Invite Link: <#{BOT.invite_url(permission_bits: 268_692_567)}>"
    end
  end
end
