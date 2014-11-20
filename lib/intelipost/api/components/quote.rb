module Intelipost::ApiComponents
  class Quote
    attr_accessor :api_key

    def initialize(api_key)
      self.api_key = api_key
    end

    def create(origin_zipcode, destination_zipcode, volumes_collection)
      raw_response = {
         "status" => "OK",
         "messages" => [],
         "content" => {
            "id" => 1022029,
            "client_id" => 243,
            "origin_zip_code" => "01419002",
            "destination_zip_code" => "04180010",
            "delivery_options" =>[{
                "delivery_method_id" => 1,
                "delivery_estimate_business_days" => 4,
                "provider_shipping_cost" => 17.4,
                "final_shipping_cost" => 17.4,
                "description" => "Correios PAC",
                "logistic_provider_name" => "CORREIOS",
                "delivery_method_type" => "STANDARD",
                "delivery_method_name" => "Correios PAC"
            }],
            "volumes" =>[{
                "weight" => 2,
                "cost_of_goods" => 30.99,
                "width" => 20,
                "height" => 10,
                "length" => 25,
                "volume_type" => "BOX"
            }]
         },
         "time" => "19.9 ms"
      }

      quote = Intelipost::Models::Quote.new
      quote.attributes = raw_response
      quote.attributes = raw_response["content"] || {}
      quote
    end
  end
end
