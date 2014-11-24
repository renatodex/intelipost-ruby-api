module Intelipost::Models
  class ErrorResponse
    include ::Virtus::Model
    
    attribute :status, String
    attribute :messages, Array
  end
end
