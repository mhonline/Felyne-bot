# Run checks on message event
module Events
  extend Discordrb::EventContainer
  message(containing: '(╯°□°）╯︵ ┻━┻') do |event|
    event.respond '┬─┬﻿ ノ( ゜-゜ノ)'
  end

  message(containing: '┬─┬﻿ ノ( ゜-゜ノ)') do |event|
    event.respond '(╯°□°）╯︵ ┻━┻'
  end

  message(containing: '111') do |event|
    id_list = %w(1112 1113 1114 1115 1116 1117 1118 1119 1110 2111 3111 4111
                 5111 6111 7111 8111 9111 0111)
    if id_list.any? { |s| event.message.content.include?(s) }
    else
      event.respond 'CATCH THE FUCKING MONSTER!!'
    end
  end

  message(containing: 'RIP') do |event|
    rip = [
      'Rest in Pizza', 'RIP in Peace', 'Ripperoni', 'Rippy Dippy Doo',
      'Rest in Peace', 'RIP in Pizza'
    ]
    event.respond rip[rand(0..(rip.length - 1))]
  end

  message(containing: [
            'english patch', 'English Patch', 'English patch', 'english Patch',
            'Eng Patch', 'Eng patch', 'eng patch', 'eng Patch', 'ENGLISH PATCH',
            'ENG PATCH'
          ]) do |event|
    engpatch = '2016-06-21 00:00:00 +0000'
    t1 = Time.now
    t4 = Time.parse(engpatch)
    d1 = TimeDifference.between(t1, t4).in_days
    d2 = d1.floor
    event.respond "Day #{d2}: Still no english patch"
  end

  message(containing: %w(Aslind aslind Asslind asslind)) do |event|
    engpatch = '2016-12-27 00:00:00 +0000'
    t1 = Time.now
    t4 = Time.parse(engpatch)
    d1 = TimeDifference.between(t1, t4).in_days
    d2 = d1.floor
    event.respond "Day #{d2}: Still no Aslind"
  end
end
