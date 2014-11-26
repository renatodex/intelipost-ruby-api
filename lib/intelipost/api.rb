["pry", "logging", "httparty", "virtus"].each { |lib| require lib }
['*.rb','models/*.rb', 'components/*.rb'].each do |p|
  Dir[File.dirname(__FILE__) + "/api/#{p}"].each {|file| require file }
end

$logger = Logging.logger(STDOUT)
$logger.level = :warn

module Intelipost
  class Api
    attr_accessor :api_key

    def initialize(api_key)
      self.api_key = api_key
    end

    def CepLocation
      ApiComponents::CepLocation.new(self.api_key)
    end

    def Quote
      ApiComponents::Quote.new(self.api_key)
    end
  end
end
