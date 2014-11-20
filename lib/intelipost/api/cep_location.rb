module Intelipost::ApiModules
  module CepLocation
    class << self
      def retrieve_address(zipcode)
        raw_data = Intelipost::Facade.get("/cep_location/address_complete/#{zipcode}")
        address = Intelipost::Models::Address.new
        address.attributes = raw_data
        address.attributes = raw_data["content"]

        address
      end
    end
  end
end
