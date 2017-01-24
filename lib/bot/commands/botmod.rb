module Commands
  # Command Module
  module Botmod
    extend Discordrb::Commands::CommandContainer
    command(
      :botmod,
      description: 'Adds mod permissions to bot',
      usage: 'botmod <@name> <level> <force>',
      permission_level: 800,
      help_available: false,
      min_args: 1,
      max_args: 4
    ) do |event, mention, level = 1, force = 'no'|
      delete_permission = 'no'
      delete_permission = 'yes' if level == 'delete'
      level = level.to_i
      permissions = load_permissions('botfiles/permissions.json')
      unless BOT.parse_mention(mention).nil?
        user_id = BOT.parse_mention(mention).id
        if permissions.key?(user_id.to_s)
          begin
            event.respond 'User permissions found... Updating permissions'
          rescue
            mute_log(event.channel.id.to_s)
          end
          current_permission_level = permissions[user_id.to_s]['lvl']
          begin
            event.respond "Current permission level: #{current_permission_level}"
          rescue
            mute_log(event.channel.id.to_s)
          end
          if [800, 999].include? current_permission_level
            if delete_permission == 'yes'
              if force == 'yes'
                begin
                  event.respond "Force deleteing user's permissions"
                rescue
                  mute_log(event.channel.id.to_s)
                end
                permissions = permissions.without(user_id)
              else
                begin
                  event.respond 'You must force deletetion of admin or botmaster'
                rescue
                  mute_log(event.channel.id.to_s)
                end
              end
            else
              if force == 'yes'
                begin
                  event.respond 'Forcing permission change to lower level'
                rescue
                  mute_log(event.channel.id.to_s)
                end
                permissions[user_id.to_s]['lvl'] = level
              end
              if force == 'no'
                begin
                  event.respond 'User permissions level is admin or higher, you must force permissions change to set lower'
                rescue
                  mute_log(event.channel.id.to_s)
                end
              end
            end
          elsif delete_permission == 'yes'
            begin
              event.respond "deleteing user's permissions"
            rescue
              mute_log(event.channel.id.to_s)
            end
            permissions = permissions.without(user_id.to_s)
          else
            begin
              event.respond "Changing user's permissions"
            rescue
              mute_log(event.channel.id.to_s)
            end
            permissions[user_id.to_s]['lvl'] = level
          end
        else
          begin
            event.respond 'User permissions not found... Adding permissions'
          rescue
            mute_log(event.channel.id.to_s)
          end
          permissions[user_id.to_s] = { 'id' => user_id, 'lvl' => level }
        end
        File.open('botfiles/permissions.json', 'w') { |f| f.write permissions.to_json }
        permissions.each do |key, _value|
          BOT.set_user_permission(permissions[key]['id'], permissions[key]['lvl'])
        end
      end
      if mention == 'check'
        event << permissions
      else
        begin
          event.respond 'Invalid user'
        rescue
          mute_log(event.channel.id.to_s)
        end
      end
      command_log('botmod', event.user.name)
      nil
    end
  end
end
