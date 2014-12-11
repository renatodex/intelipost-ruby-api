require "logging"
require "httparty"
require "virtus"
require "colorize"

require 'intelipost/api/facade'
require 'intelipost/api/version'
require 'intelipost/api/models/error_response'
require 'intelipost/api/models/address'
require 'intelipost/api/models/delivery_option'
require 'intelipost/api/models/volume'
require 'intelipost/api/models/quote'
require 'intelipost/api/components/component'
require 'intelipost/api/components/cep_location'
require 'intelipost/api/components/quote'

module Intelipost
  class Api
    attr_accessor :api_key

    def initialize(api_key, environment=nil)
      self.api_key = api_key
      $logger = Logging.logger(log_env(environment))
      $logger.level = :info
    end

    def CepLocation
      ApiComponents::CepLocation.new(self.api_key)
    end

    def Quote
      ApiComponents::Quote.new(self.api_key)
    end

    def log_env(environment)
      if environment.nil?
        STDOUT
      else
        "logs/intelipost_#{environment}.log"
      end
    end
  end
end
