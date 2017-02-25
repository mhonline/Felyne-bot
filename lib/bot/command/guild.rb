module Commands
  # Command Module
  module Guild
    extend Discordrb::Commands::CommandContainer
    command(
      [:guild, :g],
      description: 'Adds user to set up guild roles.',
      usage: 'guild <guildname>',
      min_args: 1
    ) do |event, *guild_name|
      guild_name = guild_name.join(' ').downcase
      found = ''
      added = false
      joinable = true
      if $guilds.key?(event.server.id.to_s)
        i = 0
        until i == $guilds[event.server.id.to_s].length || found.downcase == guild_name.downcase
          found = $guilds[event.server.id.to_s][i]['name'].downcase
          i += 1
        end
      else
        joinable = false
      end
      if found.downcase == guild_name.downcase
        $guilds[event.server.id.to_s].each do |x|
          server_role = event.user.roles.find do |role|
            role.name.downcase == x['name'].downcase
          end
          event.user.remove_role(server_role) unless server_role.nil?
        end
        $guilds[event.server.id.to_s].each do |x|
          next unless guild_name.downcase == x['name'].downcase
          server_role = event.server.roles.find do |role|
            role.name.downcase == x['name'].downcase
          end
          event.user.add_role(server_role)
        end
        added = true
      end
      command_log('guild', event.user.name)
      if joinable
        if added
          "Added to the #{guild_name} server role."
        else
          "The #{guild_name} server role does not exist."
        end
      else
        'The server does not have any joinable roles set up.'
      end
    end
  end
end
