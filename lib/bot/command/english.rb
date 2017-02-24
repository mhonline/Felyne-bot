module Commands
  # Command Module
  module English
    extend Discordrb::Commands::CommandContainer
    command(
      [:english, :en]
    ) do |event, *text|
      text = text.join(' ')
      command_log('chinese', event.user.name)
      EasyTranslate.translate(text, to: :english)
    end
  end
end
