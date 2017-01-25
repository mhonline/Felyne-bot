module Commands
  # Command Module
  module Raids
    extend Discordrb::Commands::CommandContainer
    command(
      :raids,
      description: 'Manage raids for channel.',
      usage: 'raids <clear>',
      help_available: true
    ) do |event|
      if $raids.key?(event.channel.id.to_s)
        past_raids = []
        if $raids[event.channel.id.to_s][0].nil?
          $raids = $raids.without(event.channel.id.to_s)
          event.respond 'You do not have any raids set right now. Set some ' \
                        "with `#{$prefix}newraid`"
        else
          (0..$raids[event.channel.id.to_s].length - 1).each do |i|
            past_raids.push(i) if Time.parse(
              $raids[event.channel.id.to_s]['raids'][i]['0']
            ).past?
          end
          past_raids.reverse.each do |i|
            $raids[event.channel.id.to_s]['raids'].delete_at(i)
          end
          desc = ''
          raid_number = 1
          $raids[event.channel.id.to_s]['raids'].each do |value|
            t4 = value['0']
            t4 = Time.parse(t4)
            d1 = TimeDifference.between(event.timestamp, t4).in_days
            h1 = TimeDifference.between(event.timestamp, t4).in_hours
            m1 = TimeDifference.between(event.timestamp, t4).in_minutes
            d2 = d1.floor
            d2 = 0 if d2 < 0
            h1 -= 24 * d2
            h2 = h1.floor
            h2 = 0 if h2 < 0
            m1 = m1 - 60 * h2 - 24 * 60 * d2
            m2 = m1.floor
            m2 = 0 if m2 < 0
            next if t4.past?
            raid_name = value['name']
            desc += if d2.zero?
                      "**#{raid_number}: #{raid_name}:** #{h2} hours #{m2} " \
                      "minutes\n"
                    else
                      "**#{raid_number}: #{raid_name}:** #{d2} days #{h2} " \
                      "hours #{m2} minutes\n"
                    end
            raid_number += 1
          end
        end
        e = embed('Raids for this channel', desc.chomp("\n"))
        event.channel.send_embed '', e
      else
        event.respond 'You do not have any raids set right now. Set some ' \
                      "with `#{$prefix}newraid`"
      end
      command_log('raids', event.user.name)
      nil
    end
  end
end
