module Commands
  # Command Module
  module Hosting
    extend Discordrb::Commands::CommandContainer
    command(
      :hosting,
      description: 'Responds with hosting info',
      usage: 'hosting'
    ) do |event|
      begin
        event.respond "This bot is hosted on DigitalOcean Servers.\nHost your" \
                      ' own bot/app with $10 credit using my referral link: <' \
                      "https://m.do.co/c/71922c060e60>\nThis will help me kee" \
                      'p this bot live as long as you keep using their hostin' \
                      'g after the first $10 credit :D'
      rescue
        mute_log(event.channel.id.to_s)
      end
      command_log('hosting', event.user.name)
      nil
    end
  end
end
