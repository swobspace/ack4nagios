require "rails_helper"

RSpec.describe ServicesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/services").to route_to("services#index")
    end

    it "routes to #show" do
      expect(:get => "/services/1").to route_to("services#show", :id => "1")
    end

  end
end
