require 'rails_helper'

RSpec.describe "Acknowledges", :type => :request do
  describe "GET /dummy/acknowledges" do
    it "access acknowledges of site dummy" do
      FactoryGirl.create(:site, name: "dummy")
      get acknowledges_path(site: "dummy")
      expect(response.status).to be(200)
    end
  end
end
