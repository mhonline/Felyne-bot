puts 'starting FelyneBot'
print 'loading required...'
require 'json'
require 'discordrb'
require 'discordrb/data'
require 'rubygems'
require 'sys/uptime'
require 'active_support'
require 'yaml'
include Sys
require 'time'
require 'time_difference'

#require command files
require_relative 'lib/felynebot/class/user'
require_relative 'lib/felynebot/class/guild'
require_relative 'lib/felynebot/class/loader'
require_relative 'lib/felynebot/class/strings'
Dir["lib/felynebot/commands/*.rb"].each {|file| require_relative file }
Dir["lib/felynebot/commands/admin/*.rb"].each {|file| require_relative file }
Dir["lib/felynebot/commands/database/*.rb"].each {|file| require_relative file }
Dir["lib/felynebot/commands/helpful/*.rb"].each {|file| require_relative file }
Dir["lib/felynebot/commands/mods/*.rb"].each {|file| require_relative file }
Dir["lib/felynebot/commands/raids/*.rb"].each {|file| require_relative file }
Dir["lib/felynebot/commands/roles/*.rb"].each {|file| require_relative file }
Dir["lib/felynebot/commands/other/*.rb"].each {|file| require_relative file }

clock=Time.new

puts "Starting at: "+clock.inspect

#Create the bot object
require_relative 'lib/felynebot'