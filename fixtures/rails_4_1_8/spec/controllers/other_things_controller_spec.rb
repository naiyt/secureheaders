# config.action_dispatch.default_headers defaults to:
# {"X-Frame-Options"=>"SAMEORIGIN", "X-XSS-Protection"=>"1; mode=block", "X-Content-Type-Options"=>"nosniff"}
# so we want to set our specs to expect something else to ensure secureheaders is taking precedence

require 'spec_helper'

describe OtherThingsController, :type => :controller do
  describe "headers" do
    it "sets the X-Frame-Options header" do
      get :index
      expect(Rails.application.config.action_dispatch.default_headers['X-Frame-Options']).to eq('SAMEORIGIN')
      expect(response.headers['X-Frame-Options']).to eq('DENY')
    end
  end
end
