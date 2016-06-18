puts 'starting felynebot'
print 'loading require...'
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
require_relative 'class/loader'
Dir["commands/*.rb"].each {|file| require_relative file }

clock=Time.new

puts "Starting at: "+clock.inspect
puts "Loading BOT"

#Create the bot object
require_relative 'felynebot'