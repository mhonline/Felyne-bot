# Make botfiles directory if the directory doesn't already exist
Dir.mkdir('botfiles') unless File.exist?('botfiles')
unless File.file?('botfiles/oldnews.json')
  File.open('botfiles/oldnews.json', 'w') do |f|
    f.write %w(news1 news2).to_json
  end
end
news_pull
# Load the environment variables
Dotenv.load
# Load all global variables
$daily = load_json('botfiles/daily.json')
$guilds = load_json('botfiles/guilds.json')
$info = load_json('botfiles/info.json')
$logs = load_json('botfiles/logs.json')
$qqnews = load_json('botfiles/qqnews.json')
$raids = load_json('botfiles/raids.json')
$remind = load_json('botfiles/remind.json')
$settings = load_json('botfiles/settings.json')
$users = load_json('botfiles/users.json')
# If debug setting doesn't already exist then set it to false by default
$settings['debug'] = false unless $settings.key?('debug')
if $settings['debug']
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][STARTUP] Debugging mode" \
       ' on!'
else
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][STARTUP] Debugging mode" \
       ' off!'
end
# Load all constant variables
SCHEDULER = Rufus::Scheduler.new
PREFIX = '-'.freeze
CLEVER = Cleverbot.new(ENV['CLEVERKEY'])
# Load the bot constant
BOT = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'],
                                          client_id: ENV['CLIENT'],
                                          prefix: PREFIX,
                                          advanced_functionality: false,
                                          ignore_bots: true,
                                          log_mode: :quiet
BOT.gateway.check_heartbeat_acks = true
# Load user permissions from file
permissions = load_permissions('botfiles/permissions.json')
permissions.each do |key, _value|
  BOT.set_user_permission(permissions[key]['id'], permissions[key]['lvl'])
end
# Load group permissions from file
group_permissions = load_json('botfiles/group_permissions.json')
group_permissions.each do |key, _value|
  BOT.set_role_permission(
    group_permissions[key]['id'],
    group_permissions[key]['lvl']
  )
end
puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][STARTUP] Permission Loaded!"
# Set up command buckets for rate limiting
BOT.bucket :info, limit: 5, time_span: 60, delay: 5
BOT.bucket :reset, limit: 1, time_span: 60
# Load all command modules
Commands.constants.each do |x|
  BOT.include! Commands.const_get x
end
# Load outside event module
BOT.include! Events
# Turn off discordrb debugging
BOT.debug = false
# Start bot in async mode
BOT.run :async
# Load game from settings and set to 0 if no game setting exists
BOT.game = if $settings.key?('game')
             $settings['game']
           else
             0
           end
# Run cron jobs to schedule jobs and post any news found
cron_jobs
news_post
# Schedule all raids from array
schedule_raids($raids) unless $raids.length.zero?
# Put bot invite url in command console just in case
puts BOT.invite_url
puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][STARTUP] Felyne-Bot Online!"
# Sync the bot object
BOT.sync
