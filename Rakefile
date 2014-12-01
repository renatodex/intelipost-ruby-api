require "bundler/gem_tasks"
require "colorize"

def load_irb
  require 'irb'
  require 'rspec'
  require_relative 'spec/spec_helper'
  ARGV.clear
  IRB.start
end

def puts_header_text
  puts "-------------------------------------"
  puts "Intelipost::Api Console".on_blue
  puts "-------------------------------------"
  puts "This is a Irb Console including Intelipost Lib and Rspec environment.".yellow
  puts "A method called ".yellow + " i ".on_red.white + " will instantiate Intelipost::Api and your key".yellow
  puts "For your convenience, you can pass an ApiKey for this method.".yellow
  puts "If you dont specify any ApiKey, we will generate the variable with a Fake ApiKey.".white
  puts "-------------------------------------"
end

def i(apikey=nil)
  o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
  o1 = (0...50).map { o[rand(o.length)] }.join

  Intelipost::Api.new((apikey || o1))
end

desc "Open an irb session preloaded with this library"
task :console, [:apikey] do |t, apikey|
  puts_header_text
  load_irb
end
