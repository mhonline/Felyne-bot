module Commands
  # Command Module
  module Reset
    extend Discordrb::Commands::CommandContainer
    command(
      :reset,
      description: 'Displays time until gift/ticket reset',
      useage: 'reset'
    ) do |event|
      t2 = Time.now.to_i
      t1 = Time.parse('19:00').to_i
      if t1 > t2
        event.respond "#{Time.at(t1 - t2).strftime('**%H** hours **%M** minutes
        **%S** seconds')} left until the next gift/ticket reset"
      else
        event.respond "#{Time.at(t1 + 86_400 - t2).strftime('**%H** hours
        **%M** minutes **%S** seconds')} left until the next gift/ticket reset"
      end
      command_log('reset', event.user.name)
      nil
    end
  end
end
