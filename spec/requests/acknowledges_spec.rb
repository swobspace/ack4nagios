require 'rails_helper'

RSpec.describe "Acknowledges", :type => :request do
  describe "GET /acknowledges" do
    it "works! (now write some real specs)" do
      get acknowledges_path
      expect(response.status).to be(200)
    end
  end
end
