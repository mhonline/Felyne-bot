puts 'starting felynebot'
print 'loading require...'
require 'json'
require 'discordrb'
require 'rubygems'
require 'sys/uptime'
require 'active_support'
require 'yaml'
include Sys
require 'time'

#require command files
require_relative 'class/user'
require_relative 'class/loader'
require_relative 'commands/ping'

clock=Time.new

puts "Starting at: "+clock.inspect
puts "Loading BOT"

#Create the bot object
require_relative 'felynebot'
