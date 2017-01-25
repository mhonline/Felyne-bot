module Commands
  # Command Module
  module Ask
    extend Discordrb::Commands::CommandContainer
    command(
      :ask
    ) do |event|
      options = [
        'It is certain', 'It is decidedly so', 'Without a doubt',
        'Yes, definitely', 'You may rely on it', 'As I see it, yes',
        'Most likely', 'Outlook good', 'Yes', 'Signs point to yes',
        'Reply hazy try again', 'Ask again later', 'Better not tell you now',
        'Cannot predict now', 'Concentrate and ask again', 'Don\'t count on it',
        'My reply is no', 'My sources say no', 'Outlook not so good',
        'Very doubtful'
      ]
      event.respond "🎱#{options[rand(0..19)]}🎱"
      command_log('ask', event.user.name)
      nil
    end
  end
end
