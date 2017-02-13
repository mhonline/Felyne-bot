module Commands
  # Command Module
  module Remindme
    extend Discordrb::Commands::CommandContainer
    command(
      [:remindme, :rm],
      description: 'Sends a reminder at the specified time.',
      usage: 'remindme <days> <hours> <mins> <text>',
      help_available: true,
      min_args: 4
    ) do |event, days, hours, minutes, *text|
      key = rand(100_000..999_999).to_s
      reminder_text = text.join(' ')
      d = days.to_i
      h = hours.to_i
      m = minutes.to_i
      t1 = Time.now
      t2 = t1 + m * 60
      t3 = t2 + h * 60 * 60
      t = t3 + d * 24 * 60 * 60
      if $remind.key?(event.user.id.to_s)
        $remind[event.user.id.to_s]['reminders'].push(
          'message' => reminder_text, 'key' => key, 'time' => t.to_s
        )
      else
        $remind[event.user.id.to_s] = { 'reminders' => [{
          'message' => reminder_text, 'key' => key, 'time' => t.to_s
        }] }
      end
      new_reminder(t.to_s, event.user.id, key, reminder_text)
      File.open('botfiles/remind.json', 'w') { |f| f.write $remind.to_json }
      command_log('remindme', event.user.name)
      "You will be reminded at #{t}"
    end
  end
end
