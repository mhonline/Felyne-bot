# Run checks on message event
module Events
  extend Discordrb::EventContainer
  message(containing: "(╯°□°）╯︵ ┻━┻") { |event|
    event.respond "┬─┬﻿ ノ( ゜-゜ノ)"
  }
  message(containing: "Open the pod bay doors") { |event|
    role = event.bot.server(122526505606709257).roles.find { |role| role.name == "Felyne" }
    newcolor = '0x'
    newcolor << getline("bot/colors",1)
    newcolor = newcolor.gsub("\n","").hex
    role.color = Discordrb::ColorRGB.new(newcolor)
      profile.avatar = File.open("pic/HAL9000.png")
    event.respond "Im sorry Dave, Im afraid I can't do that."
  }
  message(containing: "This fucking guy") { |event|
    role = event.bot.server(122526505606709257).roles.find { |role| role.name == "Felyne" }
    newcolor = '0x'
    newcolor << getline("bot/colors",1)
    newcolor = newcolor.gsub("\n","").hex
    role.color = Discordrb::ColorRGB.new(newcolor)
      profile.avatar = File.open("pic/mhol_christmas2.jpg")
    event.respond "This fucking guy indeed."
  }
  message(containing: "┬─┬﻿ ノ( ゜-゜ノ)") { |event|
    event.respond "(╯°□°）╯︵ ┻━┻"
  }
  message(containing: "111") { |event|
    id_list = ["1112", "1113", "1114", "1115", "1116", "1117", "1118", "1119", "1110", "2111", "3111", "4111", "5111", "6111", "7111", "8111", "9111", "0111"]
    if id_list.any?{|s| event.message.content.include?(s)}
    else
      event.respond "CATCH THE FUCKING MONSTER!!"
    end
  }
  message(containing: "RIP") { |event|
    rip = ["Rest in Pizza", "RIP in Peace", "Ripperoni", "Rippy Dippy Doo", "Rest in Peace", "RIP in Pizza"]
    event.respond rip[rand(0..(rip.length-1))]
  }
  message(containing: ["english patch", "English Patch", "English patch", "english Patch", "Eng Patch", "Eng patch", "eng patch", "eng Patch", "ENGLISH PATCH", "ENG PATCH"]) { |event|
    engpatch = "2016-06-21 00:00:00 +0000"
    t1 = Time.now
    t4 = Time.parse(engpatch)
    d1 = TimeDifference.between(t1, t4).in_days
    d2 = d1.floor
    event.respond "Day #{d2}: Still no english patch"
  }
  message(containing: ["Aslind", "aslind", "Asslind", "asslind"]) { |event|
    engpatch = "2016-12-27 00:00:00 +0000"
    t1 = Time.now
    t4 = Time.parse(engpatch)
    d1 = TimeDifference.between(t1, t4).in_days
    d2 = d1.floor
    event.respond "Day #{d2}: Still no Aslind"
  }
end
