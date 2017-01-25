module Commands
  # Command Module
  module NewGuild
    extend Discordrb::Commands::CommandContainer
    command(
      :newguild,
      description: 'Adds a user guild to the guilds database.',
      usage: 'newguild <GuildName>',
      min_args: 1
    ) do |event, *guild_name|
      guild_name = guild_name.join(' ').titleize
      search = ''
      if event.user.can_manage_roles?
        server_role = event.server.roles.find do |role|
          role.name.titleize == guild_name
        end
        if server_role.nil?
          new_role = event.server.create_role
          new_role.name = guild_name
          new_role.color = Discordrb::ColorRGB.new(rand(0xffffff))
          new_role.hoist = true
          new_role.mentionable = true
          if $guilds[event.server.id.to_s].empty?
            $guilds[event.server.id.to_s] = [{
              'name' => guild_name, 'id' => new_role.id
            }]
          else
            $guilds[event.server.id.to_s].push(
              'name' => guild_name, 'id' => new_role.id
            )
          end
          event.respond "The #{guild_name} role has been created on the server!"
        elsif $guilds.key?(event.server.id.to_s)
          i = 0
          until i == $guilds.length || search == guild_name
            search = $guilds[event.server.id.to_s][i]['name'].titleize
            i += 1
          end
        else
          $guilds[event.server.id.to_s] = []
        end
        if search != ''
          event.respond "The #{guild_name} role is already set up on this " \
                        'server'
        elsif $guilds[event.server.id.to_s].empty?
          $guilds[event.server.id.to_s] = [{
            'name' => server_role.name, 'id' => server_role.id
          }]
          event.respond 'Role added to database'
        else
          $guilds[event.server.id.to_s].push(
            'name' => server_role.name, 'id' => server_role.id
          )
          event.respond 'Role added to database'
        end
        File.open('botfiles/guilds.json', 'w') { |f| f.write $guilds.to_json }
      end
      command_log('newguild', event.user.name)
      nil
    end
  end
end
