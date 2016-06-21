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
require_relative 'class/user'
#require_relative 'class/guild'
require_relative 'class/loader'
require_relative 'class/strings'
Dir["commands/*.rb"].each {|file| require_relative file }
Dir["commands/admin/*.rb"].each {|file| require_relative file }
Dir["commands/database/*.rb"].each {|file| require_relative file }
Dir["commands/helpful/*.rb"].each {|file| require_relative file }
Dir["commands/mods/*.rb"].each {|file| require_relative file }
Dir["commands/raids/*.rb"].each {|file| require_relative file }
Dir["commands/roles/*.rb"].each {|file| require_relative file }

clock=Time.new

puts "Starting at: "+clock.inspect

#Create the bot object
require_relative 'felynebot'