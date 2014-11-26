module Intelipost::Models
  class ErrorResponse
    include ::Virtus::Model

    attribute :status, String
    attribute :messages, Array
    attribute :time, String
  end
end
