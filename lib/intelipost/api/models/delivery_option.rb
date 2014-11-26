module Intelipost::Models
  class DeliveryOption
    include Virtus::Model
    attribute :delivery_method_id
    attribute :delivery_estimate_business_days
    attribute :provider_shipping_cost
    attribute :final_shipping_cost
    attribute :description
    attribute :logistic_provider_name
    attribute :delivery_method_type
    attribute :delivery_method_name
  end
end
