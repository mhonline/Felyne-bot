require 'bundler/setup'
require 'active_support'
require 'cleverbot-api'
require 'date'
require 'discordrb'
require 'discordrb/data'
require 'dotenv'
require 'open-uri'
require 'rubygems'
require 'rufus-scheduler'
require 'sys/uptime'
require 'time'
require 'time_difference'
require 'titleize'
include Sys
Dir['lib/bot/class/*.rb'].each { |file| require_relative file }
Dir['lib/bot/method/*.rb'].each { |file| require_relative file }
Dir['lib/bot/module/*.rb'].each { |file| require_relative file }
Dir['lib/bot/command/*.rb'].each { |file| require_relative file }
require_relative 'lib/bot'
