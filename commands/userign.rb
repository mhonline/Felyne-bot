module FelyneBot
  module Commands
    module UserIgn
      extend Discordrb::Commands::CommandContainer
      command(:userign, max_args: 1, min_args: 1, description: "Changes IGN for user in the database.", usage: "-userign <IGN>") do |event, ign|
        temp = $users.find_index {|s| s.id == event.user.id}
        if  temp!=nil then $users[temp].addIgn(ign) end
        event << "Changed IGN to #{ign}"
        puts "#{event.timestamp}: #{event.user.name}: [userIgn] <#{ign}>"
        saveObj($users,"userbase/users")
      end
    end
  end
end
