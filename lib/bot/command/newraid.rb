module Commands
  # Command Module
  module Newraid
    extend Discordrb::Commands::CommandContainer
    command(
      [:newraid, :nr],
      description: 'Sets a raid reminder for the channel.',
      usage: 'newraid <days> <hours> <mins> <text>',
      help_available: true,
      permission_level: 1,
      min_args: 4,
      permission_message: 'You must be a raid manager to use %name%'
    ) do |event, days, hours, minutes, *text|
      key = rand(100_000..999_999).to_s
      channelname = event.channel.name
      if channelname.include? 'raid'
        if (days.to_i + hours.to_i).zero? && minutes.to_i < 60
          m = 'You can\'t set up a raid with less than an hour unti' \
                        'l start! Nobody would even show up!'
        else
          raidtext = text.join(' ')
          d = days.to_i
          h = hours.to_i
          h1 = hours.to_i - 1
          m = minutes.to_i
          m15 = minutes.to_i - 15
          m30 = minutes.to_i - 30
          m45 = minutes.to_i - 45
          t1 = Time.now
          t2 = t1 + m * 60
          t3 = t2 + h * 60 * 60
          tactual = t3 + d * 24 * 60 * 60
          t2 = t1 + m15 * 60
          t3 = t2 + h * 60 * 60
          t15 = t3 + d * 24 * 60 * 60
          t2 = t1 + m30 * 60
          t3 = t2 + h * 60 * 60
          t30 = t3 + d * 24 * 60 * 60
          t2 = t1 + m45 * 60
          t3 = t2 + h * 60 * 60
          t45 = t3 + d * 24 * 60 * 60
          t2 = t1 + m * 60
          t3 = t2 + h1 * 60 * 60
          t60 = t3 + d * 24 * 60 * 60
          if $raids.key?(event.channel.id.to_s)
            $raids[event.channel.id.to_s]['raids'].push(
              'name' => raidtext, 'key' => key, '60' => t60.to_s,
              '45' => t45.to_s, '30' => t30.to_s, '15' => t15.to_s,
              '0' => tactual.to_s
            )
          else
            $raids[event.channel.id.to_s] = { 'raids' => [{
              'name' => raidtext, 'key' => key, '60' => t60.to_s,
              '45' => t45.to_s, '30' => t30.to_s, '15' => t15.to_s,
              '0' => tactual.to_s
            }] }
          end
          newraid = {}
          newraid[event.channel.id.to_s] = { 'raids' => [{
            'name' => raidtext, 'key' => key, '60' => t60.to_s,
            '45' => t45.to_s, '30' => t30.to_s, '15' => t15.to_s,
            '0' => tactual.to_s
          }] }
          schedule_raids(newraid)
          m = "Raid for **#{raidtext}** set up!"
          File.open('botfiles/raids.json', 'w') { |f| f.write $raids.to_json }
        end
      else
        m = 'This is not a raid channel. You can only setup raid re' \
                      'minders for channels with raid in the name.'
      end
      command_log('newraid', event.user.name)
      m
    end
  end
end
