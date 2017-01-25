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
      delete = delete.to_i
      if $raids.key?(event.channel.id.to_s)
        $raids[event.channel.id.to_s]['raids'].delete_at(delete - 1) unless delete.zero?
        event.respond 'Raid was deleted.'
      else
        event << "You do not have any raids set right now. Set some with `#{$prefix}newraid`"
      end
      $raids = $raids.without(event.channel.id.to_s) if $raids[event.channel.id.to_s][0].nil?
      command_log('deleteraid', event.user.name)
      nil
    end
  end
end
