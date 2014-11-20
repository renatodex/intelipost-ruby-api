require 'spec_helper'

describe Intelipost::Api do

  let(:intelipost) {
    Intelipost::Api.new("apikey")
  }

  it "should retrieve a zipcode" do

    allow(Intelipost::Facade).to receive(:get) {{
      "status" => "OK",
      "messages" => [ ],
      "content" => {
        "state" => "São Paulo",
        "city" => "São Paulo",
        "neighborhood" => "Vila Gomes Cardim",
        "street" => "R Itupiru",
        "state_short" => "SP",
        "ibge" => "3550308",
        "bairro" => "Vila Gomes Cardim"
      },
      "time" => "1.2 ms"
    }}

    intelipost_address = intelipost.CepLocation.retrieve_address('01413000')
    expect(intelipost_address.status).to eq "OK"
    expect(intelipost_address.messages).to eq []
    expect(intelipost_address.state).to eq "Sao Paulo"
    expect(intelipost_address.city).to eq "Sao Paulo"
    expect(intelipost_address.neighborhood).to eq "Cerqueira Cesar"
    expect(intelipost_address.street).to eq "Rua Augusta"
    expect(intelipost_address.time).to eq "32.1 ms"
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
