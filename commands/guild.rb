module FelyneBot
  module Commands
    module Guild
      extend Discordrb::Commands::CommandContainer
      command(:guild, min_args: 0, max_args: 1, description: 'Add user to guild', usage: "-guild <Guildname>", permission_level: 800) do |event|
      member = event.user.on(event.server)
      member.add_role(test)
      end
    end
  end
end
