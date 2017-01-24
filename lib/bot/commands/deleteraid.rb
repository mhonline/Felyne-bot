module Commands
  # Command Module
  module Deleteraid
    extend Discordrb::Commands::CommandContainer
    command(
      :delraid,
      description: 'Delete a raid for this channel.',
      usage: 'raids <number>',
      permission_level: 2,
      help_available: true
    ) do |event, delete|
      if $raids.key?(event.channel.id.to_s)
        $raids[event.channel.id.to_s]['raids'].delete_at(delete - 1) unless delete.zero? || delete > $raids[event.channel.id.to_s]['raids'].length - 1
        event.respond 'Raid was deleted.'
      else
        event << "You do not have any raids set right now. Set some with `#{$prefix}newraid`"
      end
      command_log('deleteraid', event.user.name)
      nil
    end
  end
end
