module Commands
  # Command Module
  module UserGuild
    extend Discordrb::Commands::CommandContainer
    command(
      :userguild,
      bucket: :delay10,
      description: 'Adds guild for user to the database.',
      usage: 'userguild <set/remove/list> <guildname>',
      max_args: 2,
      min_args: 1
    ) do |event, set, search|
      # Roles function
      guilds = []
      guilds2 = []
      (1..$guilds.length).each do |i|
        name_server = "#{$guilds[i - 1].guild_name}        #{$guilds[i - 1].guild_server}"
        guilds.push($guilds[i - 1].guild_name)
        guilds2.push(name_server)
        servers.push('name' => $guilds[i - 1].guild_name.to_s, 'server' => $guilds[i - 1].guild_server.to_s)
      end
      member = event.user.on(event.server)
      guild = 0
      if set == 'remove'
        guilds.each do |x|
          server_role = member.roles.find { |role| role.name == x }
          member.remove_role(server_role) unless server_role.nil?
        end
        event.respond 'Removed from all guild server roles, and cleared guild from Database'
      end
      if set == 'list'
        output = ''
        guilds2.each { |x| output += "#{x}\n" }
        e = embed('Guild roles currently set up:', output)
        event.channel.send_embed '', e
      end
      if set == 'set'
        guilds.each do |x|
          server_role = member.roles.find { |role| role.name == x }
          member.remove_role(role) unless server_role.nil?
        end
        guilds.each do |x|
          next unless search == x
          server_role = event.server.roles.find { |role| role.name == search }
          member.add_role(server_role)
          guild = 1
        end
        if guild == 1
          event.respond "Added to the #{search} guild server role"
        else
          event.respond 'The requested guild server role does not exist.  If you would like to add your guild to the servers roles, please PM Reaver01'
        end
      end
      command_log('userguild', event.user.name)
      nil
    end
  end
end
