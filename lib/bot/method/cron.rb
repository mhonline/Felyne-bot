def cron_jobs
  SCHEDULER.every '5m' do
    File.open('botfiles/daily.json', 'w') { |f| f.write $daily.to_json }
    File.open('botfiles/guilds.json', 'w') { |f| f.write $guilds.to_json }
    File.open('botfiles/info.json', 'w') { |f| f.write $info.to_json }
    File.open('botfiles/logs.json', 'w') { |f| f.write $logs.to_json }
    File.open('botfiles/qqnews.json', 'w') { |f| f.write $qqnews.to_json }
    File.open('botfiles/raids.json', 'w') { |f| f.write $raids.to_json }
    File.open('botfiles/settings.json', 'w') { |f| f.write $settings.to_json }
    File.open('botfiles/users.json', 'w') { |f| f.write $users.to_json }
  end

  SCHEDULER.every '30m' do
    $settings['game'] = 'Fighting ' +
                        [
                          'Akura Jebia', 'Akura Vashimu', 'Arbiter Estrellian',
                          'Azure Rathalos', 'Baelidae', 'Basarios', 'Berioros',
                          'Blangonga', 'Blue Yian Kut-Ku', 'Bulldrome',
                          'Caeserber', 'Cephadrome', 'Chameleos', 'Chramine',
                          'Conflagration Rathian', 'Congalala',
                          'Crystal Basarios', 'Daimyo Hermitaur', 'Deviljho',
                          'Diablos', 'Doom Estrellian', 'Dread Baelidae',
                          'Elemental Merphistophelin', 'Estrellian',
                          'Flame Blangonga', 'Gendrome', 'Ghost Caeserber',
                          'Gold Congalala', 'Gold Hypnocatrice',
                          'GonnGenn Hermitaur', 'Gravios', 'Gypceros',
                          'Hypnocatrice', 'Ice Chramine', 'Khezu', 'Kirin',
                          'Kushala Daora', 'Lavasioth', 'Lightenna',
                          'Merphistophelin', 'Monoblos',
                          'One-Eared Yian Garuga', 'Onimusha', 'Pink Rathian',
                          'Purple Gypceros', 'Purple Slicemargl', 'Rajang',
                          'Rathalos', 'Rathian', 'Red Khezu',
                          'Rusted Kushala Daora', 'Sandstone Basarios',
                          'Shattered Monoblos', 'Shogun Ceanataur',
                          'Silver Hypnocatrice', 'Slicemargl',
                          'Swordmaster Shogun Ceanataur', 'Tartaronis',
                          'Tigrex', 'Velocidrome', 'White Monoblos',
                          'Yellow Caeserber', 'Yian Garuga', 'Yian Kut-Ku',
                          'Zinogre'
                        ].sample
    BOT.game = $settings['game']
  end

  SCHEDULER.cron '5 */3 * * *' do
    news_pull
    news_post
    # File.open('botfiles/daily.json', 'w') { |f| f.write $daily.to_json }
    # File.open('botfiles/guilds.json', 'w') { |f| f.write $guilds.to_json }
    # File.open('botfiles/info.json', 'w') { |f| f.write $info.to_json }
    # File.open('botfiles/logs.json', 'w') { |f| f.write $logs.to_json }
    # File.open('botfiles/qqnews.json', 'w') { |f| f.write $qqnews.to_json }
    # File.open('botfiles/raids.json', 'w') { |f| f.write $raids.to_json }
    # File.open('botfiles/settings.json', 'w') { |f| f.write $settings.to_json }
    # File.open('botfiles/users.json', 'w') { |f| f.write $users.to_json }
    # BOT.stop
  end

  SCHEDULER.cron '0 19 * * 1' do
    $daily.each do |key, _array|
      $bot.send_message(
        key, "Daily gift/ticket reset just happened!\n" \
             "Arena, Cat Quest, and Raid limits have been reset\n" \
             "Weekly shop limits have been reset\n" \
             "Don't forget to collect your rewards!"
      )
    end
  end

  SCHEDULER.cron '0 19 * * 2' do
    $daily.each do |key, _array|
      $bot.send_message(
        key, "Daily gift/ticket reset just happened!\n" \
             "HS Point allocation points have been reset\n" \
             "Don't forget to collect your rewards!"
      )
    end
  end

  SCHEDULER.cron '0 19 * * 3' do
    $daily.each do |key, _array|
      $bot.send_message(
        key, "Weekly gift/ticket reset just happened!\n" \
             "Your extra ticket storage has been refilled!\n" \
             "Any weekly events such as Astrolab have been reset!\n" \
             "Don't forget to collect your rewards!"
      )
    end
  end

  SCHEDULER.cron '0 19 * * 4,5,6' do
    $daily.each do |key, _array|
      $bot.send_message(
        key, "Daily gift/ticket reset just happened!\n" \
             "Don't forget to collect your rewards!"
      )
    end
  end

  SCHEDULER.cron '0 19 * * 7' do
    $daily.each do |key, _array|
      $bot.send_message(
        key, "Daily gift/ticket reset just happened!\n" \
             "Weekly Achievements have been reset\n" \
             "Don't forget to collect your rewards!"
      )
    end
  end

  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][STARTUP] Cron jobs " \
       'scheduled!'
end

def schedule_raids(array)
  x = 1
  array.each do |key, value1|
    value1['raids'].each do |value2|
      unless Time.parse(value2['0']).past?
        new_cron(
          value2['0'], key, value2['key'],
          "**#{value2['name']} Raid** is starting now!"
        )
      end
      unless Time.parse(value2['15']).past?
        new_cron(
          value2['15'], key, value2['key'],
          "**#{value2['name']} Raid** is starting in 15 minutes!"
        )
      end
      unless Time.parse(value2['30']).past?
        new_cron(
          value2['30'], key, value2['key'],
          "**#{value2['name']} Raid** is starting in 30 minutes!"
        )
      end
      unless Time.parse(value2['45']).past?
        new_cron(
          value2['45'], key, value2['key'],
          "**#{value2['name']} Raid** is starting in 45 minutes!"
        )
      end
      next if Time.parse(value2['60']).past?
      new_cron(
        value2['60'], key, value2['key'],
        "**#{value2['name']} Raid** is starting in 1 hour!"
      )
    end
    x += 1
  end
end

def new_cron(time, channel, tag, message)
  SCHEDULER.at time, tags: [channel.to_s, tag] do
    BOT.channel(channel).send_message message
  end
end
