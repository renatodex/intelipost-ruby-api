module Intelipost::ApiComponents
  class Quote < Component
    attr_accessor :api_key

    def initialize(api_key)
      self.api_key = api_key
    end

    def request_json(origin_zipcode, destination_zipcode, volumes_collection)
      {
         "origin_zip_code" => origin_zipcode,
         "destination_zip_code" => destination_zipcode,
         "volumes" => volumes_collection.inject([]) { |arr, v|
           arr << {
             "weight" => v.weight,
             "volume_type" => v.volume_type,
             "cost_of_goods" => v.cost_of_goods,
             "width" => v.width,
             "height" => v.height,
             "length" => v.length
           }
         }
      }
    end

    def create(origin_zipcode, destination_zipcode, volumes_collection)
      raw_request = self.request_json(origin_zipcode, destination_zipcode, volumes_collection)
      raw_response = Intelipost::Facade.post_with_log("/v1/quote", api_key, :body => raw_request.to_json)

      if raw_response["status"] == "ERROR"
        response = Intelipost::Models::ErrorResponse.new(raw_response)
      else
        response = Intelipost::Models::Quote.new(raw_response)
        response.attributes = raw_response["content"] || {}
        response.volumes = raw_response["content"]["volumes"].inject([]) { |res, volume|
          res << Intelipost::Models::Volume.new(volume)
          res
        }
        response.delivery_options = raw_response["content"]["delivery_options"].inject([]) { |res, delivery_option|
          res << Intelipost::Models::DeliveryOption.new(delivery_option)
          res
        }
      end

      response
    end
  end
end
