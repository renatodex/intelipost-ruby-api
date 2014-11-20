require 'spec_helper'

describe Intelipost::ApiModules::CepLocation do

  let(:intelipost) {
    Intelipost::Api.new("apikey")
  }

  it "should retrieve a zipcode" do
    allow(Intelipost::Facade).to receive(:get) {{
      "status" => "OK",
      "messages" => [ ],
      "content" => {
        "state" => "Sao Paulo",
        "city" => "Sao Paulo",
        "neighborhood" => "Cerqueira Cesar",
        "street" => "Rua Augusta",
        "state_short" => "SP",
        "ibge" => "3550308",
        "bairro" => "Vila Gomes Cardim"
      },
      "time" => "32.1 ms"
    }}

    intelipost_address = intelipost.CepLocation.retrieve_address('01413000')
    expect(intelipost_address.status).to eq "OK"
    expect(intelipost_address.messages).to eq []
    expect(intelipost_address.state).to eq "Sao Paulo"
    expect(intelipost_address.city).to eq "Sao Paulo"
    expect(intelipost_address.neighborhood).to eq "Cerqueira Cesar"
    expect(intelipost_address.street).to eq "Rua Augusta"
    expect(intelipost_address.time).to eq "32.1 ms"
    expect(intelipost_address.ibge).to eq "3550308"
  end
end
