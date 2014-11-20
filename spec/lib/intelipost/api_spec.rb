require 'spec_helper'

describe Intelipost::Api do
  it "should retrieve a zipcode" do
    address = Intelipost::Api::CepLocation.retrieve_address('01413000')
    expect(address).to eq({
      :status => "OK",
      :messages => [ ],
      :content => {
        :state => "Sao Paulo",
        :city => "São Paulo",
        :bairro => "Cerqueira Cesar",
        :street => "Rua Augusta"
      },
      :time => "32.1 ms"
    })
  end
end


# API Structure:
# Intelipost::Api::CepLocation.address_complete(zipcode)
# Intelipost::Api::Tracking.create()
# Intelipost::Api::Quote.create('')
# Intelipost::Api::Quote.find('')
# Intelipost::Api::ShipmentOrder.create()
# Intelipost::Api::ShipmentOrder.find()
# Intelipost::Api::ShipmentOrder.cancel()
# Intelipost::Api::ShipmentOrder.end_customer()
# Intelipost::Api::ShipmentOrder.invoice_data()
# Intelipost::Api::ShipmentOrder.get_label()
# Intelipost::Api::ShipmentOrder.get_volumes()
# Intelipost::Api::ShipmentOrder.read_status()
# Intelipost::Api::ShipmentOrder.ready_for_shipment()
# Intelipost::Api::ShipmentOrder.set_invoice()
# Intelipost::Api::ShipmentOrder.set_tracking_data()
# Intelipost::Api::ShipmentOrder.set_volume()
# Intelipost::Api::ShipmentOrder.shipped()
