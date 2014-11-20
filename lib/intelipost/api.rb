require "httparty"
require "virtus"
require "intelipost/api/version"
require "intelipost/api/facade"
require "intelipost/api/models/address"
require "intelipost/api/cep_location"

module Intelipost
  class Api
    def initialize(api_key)
    end

    def CepLocation
      ApiModules::CepLocation
    end
  end
end
