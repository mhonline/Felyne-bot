module Commands
  # Command Module
  module Giveaway
    extend Discordrb::Commands::CommandContainer
    command(
      [:giveaway, :give],
      description: 'Selects an active user on the server to give something to.',
      usage: 'giveaway',
      help_available: false,
      permission_level: 10
    ) do |event|
      eligible_users = []
      $users[event.server.id.to_s].each do |key, value|
        eligible_users.push(key) if value > 99
      end
      if eligible_users.count < 50
        event.respond 'The server does not have enough eligible users to do ' \
                      "a giveaway at this time.\nThere are currently only" \
                      " #{eligible_users.count} eligible users."
      else
        winner = eligible_users.sample
        event.respond "#{BOT.user(winner).mention} You have won the giveaway!" \
                      "\nMake sure you respond to #{event.user.mention} or " \
                      'they might give your prize to someone else!'
      end
      command_log('giveaway', event.user.name)
      nil
    end
  end
end
