module Intelipost::Models
  class Address
    include ::Virtus::Model

    attribute :status, String
    attribute :messages, Array
    attribute :state, String
    attribute :city, String
    attribute :neighborhood, String
    attribute :street, String
    attribute :time, String
    attribute :state_short, String
    attribute :ibge, String
  end
end
