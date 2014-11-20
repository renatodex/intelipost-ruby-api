require "httparty"
require "intelipost/api/version"
require "intelipost/api/facade"

module Intelipost
  module Api
    module CepLocation
      class << self
        def retrieve_address(zipcode)
          Facade.get("/cep_location/address_complete/#{zipcode}")
        end
      end
    end
  end
end
