require "pry"
require "logging"
require "httparty"
require "virtus"
require "intelipost/api/version"
require "intelipost/api/facade"
require "intelipost/api/models/address"
require "intelipost/api/models/quote"
require "intelipost/api/models/error_response"
require "intelipost/api/components/cep_location"
require "intelipost/api/components/quote"

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
