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

#require logger
require_relative 'logger'
require_relative 'stats'

# Supresses warning: already initialized constant Discordrb::LOGGER
original_verbosity = $VERBOSE
$VERBOSE = nil

debug = ARGV.include?('-debug') ? true : false
Discordrb::LOGGER = LOGGER = if debug
                               FelyneBot::Logger.new(:debug)
                             else
                               FelyneBot::Logger.new
                             end

$VERBOSE = original_verbosity

#require command files
require_relative 'class/user'
require_relative 'class/loader'
Dir["commands/*.rb"].each {|file| require_relative file }

clock=Time.new

puts "Starting at: "+clock.inspect

#Create the bot object
require_relative 'felynebot'