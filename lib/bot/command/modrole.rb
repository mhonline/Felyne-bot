module Commands
  # Command Module
  module Modrole
    extend Discordrb::Commands::CommandContainer
    command(
      :modrole,
      description: 'Specify a mod role (or delete one)',
      usage: 'modrole <@name> <delete>',
      min_args: 1,
      max_args: 4,
      required_permissions: :administrator,
      permission_message: 'Only an admin can use %name%'
    ) do |event, mention, delete = false|
      group_permissions = load_json('botfiles/group_permissions.json')
      if BOT.parse_mention(mention).nil?
        begin
          event.respond 'Invalid user' unless mention == 'delete'
        rescue
          mute_log(event.channel.id.to_s)
        end
      else
        group_id = BOT.parse_mention(mention).id
        if group_permissions.key?(group_id.to_s)
          begin
            event.respond 'This role is already a mod role.'
          rescue
            mute_log(event.channel.id.to_s)
          end
          if delete
            begin
              event.respond 'Removing mod role permissions from role.'
            rescue
              mute_log(event.channel.id.to_s)
            end
            group_permissions = group_permissions.without(group_id.to_s)
          end
        else
          begin
            event.respond 'Making this role a mod role.'
          rescue
            mute_log(event.channel.id.to_s)
          end
          group_permissions[group_id.to_s] = {
            'id' => group_id, 'lvl' => 10
          }
        end
        File.open('botfiles/group_permissions.json', 'w') do |f|
          f.write group_permissions.to_json
        end
        group_permissions.each do |key, _value|
          BOT.set_role_permission(
            group_permissions[key]['id'],
            group_permissions[key]['lvl']
          )
        end
      end
      command_log('raidrole', event.user.name)
      nil
    end
  end
end
