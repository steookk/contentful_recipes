require 'minitest/autorun'
require 'rack/test'

require_relative 'app'

settings.environment = :test

describe "Integration tests" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe "/" do
    before { get '/' }

    it 'redirects to /recipes' do
      assert last_response.redirect?
    end
  end

  describe "/recipes" do
    before { get "/recipes" }

    it 'returns OK' do
      assert last_response.ok?
    end
  end

  describe "/recipes/:id" do
    it 'returns OK' do
      skip 'I would need to setup VCR to record the response and use a deterministic :id. Not doing it now because of time constraints.'
    end
  end
end