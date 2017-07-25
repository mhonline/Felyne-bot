# Run checks on message event
module Events
  extend Discordrb::EventContainer
  message(containing: '(╯°□°）╯︵ ┻━┻') do |event|
    event.channel.start_typing
    sleep rand(1..2)
    event.respond '┬─┬﻿ ノ( ゜-゜ノ)'
  end

  message(containing: '┬─┬﻿ ノ( ゜-゜ノ)') do |event|
    event.channel.start_typing
    sleep rand(1..2)
    event.respond '(╯°□°）╯︵ ┻━┻'
  end

  message(containing: [
            'english patch', 'English Patch', 'English patch', 'english Patch',
            'Eng Patch', 'Eng patch', 'eng patch', 'eng Patch', 'ENGLISH PATCH',
            'ENG PATCH'
          ]) do |event|
    event.respond BOT.channel(336718236458680321).mention if event.message.content.include?('where') or event.message.content.include?('Where')
  end

  message do |event|
    unless event.message.content.include?(PREFIX)
      if event.message.channel.pm?
        event.channel.start_typing
        sleep rand(1..3)
        event.respond CLEVER.say(event.message.content, event.user)
      else
        unless BOT.parse_mention(
          event.message.content
        ).nil? || event.channel.default?
          if BOT.parse_mention(
            event.message.content
          ).id == 192_753_495_806_312_451
            text = event.message.content.delete('<@192753495806312451>')
            event.channel.start_typing
            sleep rand(1..3)
            event.respond CLEVER.say(text, event.user)
          end
        end
        if $users.key?(event.server.id.to_s)
          if $users[event.server.id.to_s].key?(event.user.id.to_s)
            $users[event.server.id.to_s][event.user.id.to_s] += 1
          else
            $users[event.server.id.to_s][event.user.id.to_s] = 1
          end
        else
          $users[event.server.id.to_s] = { event.user.id.to_s => 1 }
        end
      end
    end
  end
end
