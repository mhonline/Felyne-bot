module Commands
  # Command Module
  module Reset
    extend Discordrb::Commands::CommandContainer
    command(
      [:reset, :res],
      description: 'Displays time until gift/ticket reset',
      useage: 'reset'
    ) do |event|
      t2 = Time.now.to_i
      t1 = Time.parse('19:00').to_i
      command_log('reset', event.user.name)
      if t1 > t2
        "#{Time.at(t1 - t2).strftime(
          '**%H** hours **%M** minutes **%S** seconds'
        )} left until the next gift/ticket reset"
      else
        "#{Time.at(t1 + 86_400 - t2).strftime(
          '**%H** hours **%M** minutes **%S** seconds'
        )} left until the next gift/ticket reset"
      end
    end
  end
end
