module Commands
  # Command Module
  module NewGuild
    extend Discordrb::Commands::CommandContainer
    command(
      :newguild,
      description: 'Adds a user guild to the guilds database.',
      usage: 'newguild <GuildName>',
      min_args: 1,
      max_args: 1,
      permission_level: 800,
      permission_message: 'Talk to the server admin if you have a new guild you would like added to the server.'
    ) do |event, search, server|
      server_role = event.server.roles.find { |role| role.name == search }
      if server_role.nil?
        event.respond "The role **#{search}** does not exist on the server. Please create it before running the command again."
      else
        Guilds.new(role.id, search, server, $guilds, event.message.channel, BOT)
        File.open('botfiles/guilds.json', 'w') { |f| f.write $guilds.to_json }
      end
      command_log('newguild', event.user.name)
      nil
    end
  end
end
