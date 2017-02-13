module Commands
  # Command Module
  module Raidrole
    extend Discordrb::Commands::CommandContainer
    command(
      [:raidrole, :rr],
      description: 'Specify a raid manager role (or delete one)',
      usage: 'raidrole <@name> <delete>',
      min_args: 1,
      max_args: 4,
      required_permissions: [:manage_roles],
      permission_message: 'Only a role manager can use %name%'
    ) do |event, mention, delete = false|
      group_permissions = load_json('botfiles/group_permissions.json')
      if BOT.parse_mention(mention).nil?
        m = 'Invalid user' unless mention == 'delete'
      else
        group_id = BOT.parse_mention(mention).id
        if group_permissions.key?(group_id.to_s)
          m = 'This role is already a raid manager.'
          if delete
            m = 'Removing raid manager permissions from role.'
            group_permissions = group_permissions.without(group_id.to_s)
          end
        else
          m = 'Making this role a raid manager.'
          group_permissions[group_id.to_s] = {
            'id' => group_id, 'lvl' => 1
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
      m
    end
  end
end
