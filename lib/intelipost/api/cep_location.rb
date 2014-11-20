module Intelipost::ApiModules
  module CepLocation
    class << self
      def retrieve_address(zipcode)

        raw_data = Intelipost::Facade.get("/cep_location/address_complete/#{zipcode}")


        address = Intelipost::Models::Address.new

        address.status = raw_data["status"]
        address.messages = []
        address.attributes = {
          "state" => "Sao Paulo",
          "city" => "Sao Paulo",
          "neighborhood" => "Cerqueira Cesar",
          "street" => "Rua Augusta",
          "state_short" => "SP",
          "ibge" => "3550308",
          "time" => "32.1 ms"
        }

        address
      end
    end
  end
end
