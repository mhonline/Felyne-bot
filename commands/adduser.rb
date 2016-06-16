module FelyneBot
  module Commands
    module AddUser
      extend Discordrb::Commands::CommandContainer
      command(:adduser,min_args: 1, max_args: 1, description: "Adds a user the the database. -adduser <IGN>", usage: "-adduser <IGN>") do |event, ign|
        puts "#{event.timestamp}: #{event.user.name}: -adduser <#{ign}>"
        tempUser= User.new(event.user.id, event.user.name, ign, $users, event.message.channel, $bot)
        saveObj($users,"userbase/users")
        puts "Command worked"
      end
    end
  end
end
