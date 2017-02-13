module Commands
  # Command Module
  module Sets
    extend Discordrb::Commands::CommandContainer
    command(
      [:set, :sets, :s],
      description: 'Lists recommended sets for <weapon>.',
      usage: 'sets'
    ) do |event|
      command_log('sets', event.user.name)
      'MHO Weapon Setup Suggestion Spreadsheet: <https://docs.google.com/spre' \
      "adsheets/d/1q1msLZ0cib-1XOFO8XbWRvbN9mbXpsdiFAjvCL2lpNI>\nForm to sugg" \
      'est new sets: <https://docs.google.com/forms/d/e/1FAIpQLSfA3A6wUsr1-Zd' \
      'Hm_PYBzy0RE57SLjhBZCtnM5cD_Vr9HT5bQ/viewform>'
    end
  end
end
