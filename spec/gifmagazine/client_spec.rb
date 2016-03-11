require "spec_helper"

describe Gifmagazine::Client do
  def stub_api_request
    stub_request(request_method, request_url).with(
      body: nil,
      headers: request_headers
      ).to_return(
      body: response_body,
      headers: response_headers,
      status: response_status
      )
  end

  let(:request_headers) do
    Gifmagazine::Client::DEFAULT_HEADERS.clone
  end

  let(:response_body) do
    {"data" => []}.to_json
   end

  let(:response_headers) do
    {"Content-Type" => "application/json"}
  end

  let(:response_status) do
    200
  end

  let(:host) { 'api.gifmagazine.net' }

  let(:client) { Gifmagazine::Client.new }

  describe ".new" do
    it "return valid instance" do
      expect(Gifmagazine::Client.new).to be_a described_class
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

    context "request /v1/gifs/search" do
      let(:path) { '/v1/gifs/search' }

      context "params q only without token" do
        let(:request_url) do
          "http://#{host}#{URI.escape(path)}?q=#{params[:q]}"
        end
        let(:params) do
          {
            q: 'cat'
          }
        end
        it "return valid response" do
          should be_a Gifmagazine::Response
        end
      end

      context "params q only with token" do
        let(:request_url) do
          "http://#{host}#{URI.escape(path)}?q=#{params[:q]}&token=#{params[:token]}"
        end
        let(:params) do
          {
            q: 'cat',
            token: 'example'
          }
        end
        it "return valid response" do
          should be_a Gifmagazine::Response
        end
      end
    end

    context "request /v1/gifs/emotion" do
      let(:path) { '/v1/gifs/emotion' }

      context "params q only without token" do
        let(:request_url) do
          "http://#{host}#{URI.escape(path)}?q=#{params[:q]}"
        end
        let(:params) do
          {
            q: 'joy'
          }
        end
        it "return valid response" do
          should be_a Gifmagazine::Response
        end
      end

      context "params q only with token" do
        let(:request_url) do
          "http://#{host}#{URI.escape(path)}?q=#{params[:q]}&token=#{params[:token]}"
        end
        let(:params) do
          {
            q: 'cat',
            token: 'example'
          }
        end
        it "return valid response" do
          should be_a Gifmagazine::Response
        end
      end
    end
  end
end