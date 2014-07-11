require 'rails_helper'

RSpec.describe "Sites", :type => :request do
  describe "GET /sites" do
    it "works! (now write some real specs)" do
      get sites_path
      expect(response.status).to be(200)
    end
  end
end
