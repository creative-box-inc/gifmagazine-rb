require "spec_helper"

describe Gifmagazine::Client do
  def stub_api_request
    stub_request(request_method, request_url).with(
      body: "",
      headers: request_headers
      ).to_return(
      body: response_body,
      headers: response_headers,
      status: response_status
      )
  end

  def formatted_params
    prms = params.to_h.map do |k,v|
      "#{k}=#{v}"
    end.join('&')
    prms.present? ? "?#{prms}" : ""
  end

  let(:request_headers) do
    Gifmagazine::Client::DEFAULT_HEADERS.clone
  end

  let(:response_body) do
    response_hash.to_json
   end

  let(:response_headers) do
    {"content-type" => "application/json"}
  end

  let(:response_hash) do
    { "dummy" => "dummy" }
  end

  let(:response_status) do
    200
  end

  let(:request_url) do
    "http://#{request_host}#{path}#{formatted_params}"
  end

  let(:request_host) do
    Gifmagazine::Client::DEFAULT_HOST
  end

  let(:host) { 'api.gifmagazine.net' }

  let(:path) do
    "/v1/dummy"
  end

  let(:params) do
  end

  let(:client) { Gifmagazine::Client.new }

  shared_examples_for "returns a Gifmagazine::Response" do
    it "returns a Gifmagazine::Response" do
      should be_a Gifmagazine::Response
      expect(subject.body).to eq response_hash
      expect(subject.headers).to eq response_headers
      expect(subject.status).to eq response_status
    end
  end

  describe ".new" do

    shared_examples_for "returns a Gifmagazine::Client" do
      it "returns a Gifmagazine::Client" do
        should be_a described_class
      end
    end

    context "without any arguments" do
      let(:arguments) do
        []
      end
      include_examples "returns a Gifmagazine::Client"
    end

    context "with :token option" do
      let(:options) do
        { token: "dummy" }
      end
      include_examples "returns a Gifmagazine::Client"
    end
  end

  describe ".get" do
    before do
      stub_api_request
    end

    subject do
      client.get(*arguments)
    end

    let(:arguments) do
      [path, params]
    end

    let(:request_method) do
      :get
    end

    context "without params" do
      let(:arguments) do
        [path, params]
      end
      include_examples "returns a Gifmagazine::Response"
    end

    context "with params without :token option" do
      let(:token) do
        ""
      end

      let(:params) do
        {
          key: 1,
          kkey: 2
        }
      end

      it "sends request without token" do
        should be_a Gifmagazine::Response
      end
    end

    context "with params with :token option" do
      let(:token) do
        "dummy-token"
      end

      let(:params) do
        {
          token: token
        }
      end

      it "sends request with token" do
        should be_a Gifmagazine::Response
      end
    end

  end
end