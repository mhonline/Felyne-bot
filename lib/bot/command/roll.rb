module Commands
  # Command Module
  module Roll
    extend Discordrb::Commands::CommandContainer
    command(
      :roll
    ) do |event, number|
      number = 6 if number.nil?
      command_log('roll', event.user.name)
      "🎲A D#{number.to_i} is rolled: #{rand(1..number.to_i)}🎲"
    end
  end
end
