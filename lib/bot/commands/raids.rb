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
        (0..$raids[event.channel.id.to_s].length - 1).each do |i|
          past_raids.push(i) if Time.parse($raids[event.channel.id.to_s]['raids'][i]['0']).past?
        end
        past_raids.reverse.each do |i|
          $raids[event.channel.id.to_s]['raids'].delete_at(i)
        end
        desc = ''
        $raids[event.channel.id.to_s]['raids'].each do |index, value|
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
                    "**#{index + 1}: #{raid_name}:** #{h2} hours #{m2} minutes\n"
                  else
                    "**#{index + 1}: #{raid_name}:** #{d2} days #{h2} hours #{m2} minutes\n"
                  end
        end
        desc = 'No raids set up' if desc == ''
        e = embed('Raids for this channel', desc.chomp("\n"))
        event.channel.send_embed '', e
      else
        event << "You do not have any raids set right now. Set some with `#{$prefix}newraid`"
      end
      command_log('raids', event.user.name)
      nil
    end
  end
end
