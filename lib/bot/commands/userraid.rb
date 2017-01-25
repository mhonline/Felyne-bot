module Commands
  # Command Module
  module UserRaid
    extend Discordrb::Commands::CommandContainer
    command(
      :userraid,
      description: 'Add user to Raid Ready server role',
      usage: 'userraid <yes/no>',
      min_args: 1,
      max_args: 1
    ) do |event, search|
      member = event.user.on(event.server)
      if search == 'yes'
        server_role = eevent.server.roles.find do |role|
          role.name == 'RaidReady'
        end
        member.add_role(server_role)
        event.respond 'Added to RaidReady Role'
      end
      if search == 'no'
        server_role = event.server.roles.find do |role|
          role.name == 'RaidReady'
        end
        member.remove_role(server_role)
        event.respond 'Removed from RaidReady Role"'
      end
      command_log('userraid', event.user.name)
      nil
    end
  end
end
