require 'spec_helper'

describe Intelipost::Api do

  shared_examples "intelipost_request" do
    it {
      allow(Intelipost::Facade).to receive(request_method).and_raise SocketError
      response = Intelipost::Facade.send("#{request_method}_with_log",'http://test.com', 'apikey', {})
      expect(response.status).to eq "ERROR"
      expect(response.messages.first["type"]).to eq "ERROR"
      expect(response.messages.first["text"]).to eq "Connection Timeout"
      expect(response.messages.first["key"]).to eq "timeout"
    }
  end

  [:get, :post].each do |method|
    describe "Timeout for #{method} request" do
      it_behaves_like "intelipost_request" do
        let(:request_method) { method }
      end
    end
  end
end
