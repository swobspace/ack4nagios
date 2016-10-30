require "rails_helper"

RSpec.describe AcknowledgesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mysite/acknowledges").to route_to("controller"=>"acknowledges", "action"=>"index", "site"=>"mysite")
    end

  end
end
