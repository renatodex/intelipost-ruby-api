module Intelipost::Models
  class Volume
    include Virtus::Model

    attribute :weight
    attribute :cost_of_goods
    attribute :width
    attribute :height
    attribute :length
    attribute :volume_type
  end
end
