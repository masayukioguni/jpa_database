require 'rails_helper'

RSpec.describe "Lifters", :type => :request do
  describe "GET /lifters" do
    it "works! (now write some real specs)" do
      get lifters_path
      expect(response).to have_http_status(200)
    end
  end
end
