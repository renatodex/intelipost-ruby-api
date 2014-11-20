module Intelipost::ApiComponents
  class CepLocation
    attr_accessor :api_key

    def initialize(api_key)
      self.api_key = api_key
    end

    def address_complete(zipcode)
      raw_data = Intelipost::Facade.get_with_log("/v1/cep_location/address_complete/#{zipcode}", api_key)
      address = Intelipost::Models::Address.new

      address.attributes = raw_data
      address.attributes = raw_data["content"] || {}

      address
    end
  end
end
