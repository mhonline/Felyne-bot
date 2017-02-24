module Commands
  # Command Module
  module Chinese
    extend Discordrb::Commands::CommandContainer
    command(
      :chinese
    ) do |event, *text|
      text = text.join(' ')
      command_log('chinese', event.user.name)
      EasyTranslate.translate(text, to: :chinese)
    end
  end
end
