["pry", "logging", "httparty", "virtus", "colorize"].each { |lib| require lib }
['*.rb','models/*.rb', 'components/*.rb'].each do |p|
  Dir[File.dirname(__FILE__) + "/intelipost/api/#{p}"].each {|file| require file }
end

require 'intelipost/api'
