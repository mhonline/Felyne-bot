module Commands
  # Command Module
  module Sets
    extend Discordrb::Commands::CommandContainer
    command(
      [:set, :sets, :s],
      description: 'Lists recommended sets for <weapon>.',
      usage: 'sets',
      min_args: 1
    ) do |event|
      event.respond 'MHO Weapon Setup Suggestion Spreadsheet: <https://docs.g' \
                    'oogle.com/spreadsheets/d/1q1msLZ0cib-1XOFO8XbWRvbN9mbXps' \
                    "diFAjvCL2lpNI>\nForm to suggest new sets: <https://docs." \
                    'google.com/forms/d/e/1FAIpQLSfA3A6wUsr1-ZdHm_PYBzy0RE57S' \
                    'LjhBZCtnM5cD_Vr9HT5bQ/viewform>'
      command_log('sets', event.user.name)
      nil
    end
  end
end
