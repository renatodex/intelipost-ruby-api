require "pry"
require "logging"
require "httparty"
require "virtus"
require "intelipost/api/version"
require "intelipost/api/facade"
require "intelipost/api/models/address"
require "intelipost/api/cep_location"

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
  end
end
