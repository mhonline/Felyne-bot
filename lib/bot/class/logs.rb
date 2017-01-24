def command_log(command_name, user_name)
  $logs['commands'] = {} unless $logs.key?('commands')
  $logs['commands'][command_name] = 0 unless $logs['commands'].key?(command_name)
  $logs['commands'][command_name] += 1
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][COMMAND] #{user_name}: #{command_name}"
end

def mute_log(channel_id)
  $logs['muted'] = {} unless $logs.key?('muted')
  if $logs['muted'].key?(channel_id.to_s)
    $logs['muted'][channel_id.to_s].push(Time.now)
  else
    $logs['muted'][channel_id.to_s] = [Time.now]
  end
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][MUTE] BOT has been muted in #{channel_id}"
end

def killed_log(channel_id, monster_name)
  $logs['monsters_killed'] = {} unless $logs.key?('monsters_killed')
  unless $logs['monsters_killed'].key?(monster_name)
    $logs['monsters_killed'][monster_name] = 0
  end
  $logs['monsters_killed'][monster_name] += 1
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][KILLED] #{monster_name} has been killed in #{channel_id}"
end
