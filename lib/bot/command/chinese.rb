module Commands
  # Command Module
  module Chinese
    extend Discordrb::Commands::CommandContainer
    command(
      [:chinese, :ch]
    ) do |event, *text|
      text = text.join(' ')
      command_log('chinese', event.user.name)
      EasyTranslate.translate(text, to: :chinese_simplified)
    end
  end
end
