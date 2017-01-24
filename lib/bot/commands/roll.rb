module Commands
  # Command Module
  module Roll
    extend Discordrb::Commands::CommandContainer
    command(
      :roll,
      bucket: :delay10
    ) do |event, number|
      number = 6 if number.nil?
      event.respond ":game_die:A D#{number.to_i} is rolled: #{rand(1..number.to_i)}:game_die:"
      command_log('roll', event.user.name)
      nil
    end
  end
end
