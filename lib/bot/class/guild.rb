# Creates a guild for the server
class Guilds
  def initialize(role, guildname, server, array, channel, b)
    @guild_role = role
    @guild_name = guildname
    @guild_server = server

    if array.empty?
      array.push(self)
      b.send_message(channel, "**#{guildname}** not found in (empty) database, added. Guild: **#{guildname}**")
    elsif array.any? { |a| a.guild_name == guild_name }
      b.send_message(channel, "**#{guildname}** found in database, skipped.")
    else
      array.push(self)
      b.send_message(channel, "**#{guildname}** not found in database, added. Guild: **#{guildname}**")
    end
  end
  attr_reader :guild_role
  attr_reader :guild_name
  attr_reader :guild_server
end
