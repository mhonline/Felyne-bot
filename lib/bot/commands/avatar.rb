#module Commands
#  # Command Module
#  module Avatar
#    extend Discordrb::Commands::CommandContainer
#    command(
#      :avatar,
#     description: 'Changes avatar randomly',
#      usage: 'avatar',
#      help_available: false,
#      permission_level: 2,
#      permission_message: "I'm sorry Dave, I cannot do that."
#    ) do |event|
#      picture = 1 + rand(35)
#      BOT.profile.avatar = File.open("pic/#{picture}.jpg")
#      server_role = event.bot.server(122526505606709257).roles.find { |role| role.name == 'Felyne' }
#      newcolor = '0x'
#      picture += 1
#      newcolor << getline('botfiles/colors', picture)
#      newcolor = newcolor.gsub("\n").hex
#      server_role.color = Discordrb::ColorRGB.new(newcolor)
#      BOT.send_message(event.message.channel, 'Changing Avatar!')
#      command_log('avatar', event.user.name)
#      nil
#    end
#  end
#end
