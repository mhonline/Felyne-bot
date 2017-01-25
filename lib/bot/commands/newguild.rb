module Commands
  # Command Module
  module NewGuild
    extend Discordrb::Commands::CommandContainer
    command(
      :newguild,
      description: 'Adds a user guild to the guilds database.',
      usage: 'newguild <GuildName>',
      min_args: 1,
      max_args: 1
    ) do |event, guild_name|
      if event.user.can_manage_roles?
        server_role = event.server.roles.find { |role| role.name == guild_name }
        if server_role.nil?
          new_role = event.server.create_role
          new_role.name = guild_name.titleize
          new_role.color = Discordrb::ColorRGB.new(rand(0xffffff))
          new_role.hoist = true
          new_role.mentionable = true
          $guilds[event.server.id.to_s].push(
            'name' => guild_name.titleize, 'id' => new_role.id
          )
        elsif $guilds.key?(event.server.id.to_s)
          i = 0
          search = ''
          until i == $guilds.length || search == guild_name.titleize
            search = $guilds[event.server.id.to_s][i]
            i += 1
          end
          if search != ''
            event.respond "The #{search} role is already set up on this " \
                          'server'
          else
            $guilds[event.server.id.to_s].push(
              'name' => search, 'id' => server_role.id
            )
          end
        end
        File.open('botfiles/guilds.json', 'w') { |f| f.write $guilds.to_json }
      end
      command_log('newguild', event.user.name)
      nil
    end
  end
end
