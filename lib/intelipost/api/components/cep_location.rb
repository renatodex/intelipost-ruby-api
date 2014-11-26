module Intelipost::ApiComponents
  class CepLocation < Component
    attr_accessor :api_key

    def initialize(api_key)
      self.api_key = api_key
    end

    def address_complete(zipcode)
      raw_data = Intelipost::Facade.get_with_log("/v1/cep_location/address_complete/#{zipcode}", api_key)

      if has_error?(raw_data)
        response = Intelipost::Models::ErrorResponse.new(raw_data)
      else
        response = Intelipost::Models::Address.new
        response.attributes = raw_data
        response.attributes = raw_data["content"] || {}
      end

      response
    end
  end
end
