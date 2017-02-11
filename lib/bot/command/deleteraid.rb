module Commands
  # Command Module
  module Deleteraid
    extend Discordrb::Commands::CommandContainer
    command(
      [:delraid, :dr],
      description: 'Delete a raid for this channel.',
      usage: 'raids <number>',
      permission_level: 1,
      help_available: true,
      permission_message: 'You must be a raid manager to use %name%'
    ) do |event, delete|
      delete = delete.to_i
      channel_s = event.channel.id.to_s
      if $raids.key?(channel_s)
        unless delete.zero?
          SCHEDULER.jobs(
            tags: [channel_s, $raids[channel_s]['raids'][delete - 1]['key']]
          ).each(&:unschedule)
          $raids[channel_s]['raids'].delete_at(delete - 1)
          event.respond 'Raid was deleted.'
        end
      else
        event.respond 'You do not have any raids set right now. Set some with' \
                      " `#{$prefix}newraid`"
      end
      $raids = $raids.without(channel_s) if $raids[channel_s]['raids'][0].nil?
      command_log('deleteraid', event.user.name)
      nil
    end
  end
end
