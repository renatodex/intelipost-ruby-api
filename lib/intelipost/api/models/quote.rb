module Intelipost::Models
  class Quote
    include Virtus::Model

    attribute :id, Integer
    attribute :client_id, Integer
    attribute :origin_zip_code, String
    attribute :destination_zip_code, String
    attribute :status, String
    attribute :messages, Array
    attribute :time, String
  end
end
