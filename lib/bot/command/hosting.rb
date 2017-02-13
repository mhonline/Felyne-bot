module Commands
  # Command Module
  module Hosting
    extend Discordrb::Commands::CommandContainer
    command(
      :hosting,
      description: 'Responds with hosting info',
      usage: 'hosting'
    ) do |event|
      command_log('hosting', event.user.name)
      "This bot is hosted on DigitalOcean Servers.\nHost your own bot/app wit" \
      'h $10 credit using my referral link: <https://m.do.co/c/71922c060e60>' \
      "\nThis will help me keep this bot live as long as you keep using their" \
      ' hosting after the first $10 credit :D'
    end
  end
end
