require "rails_helper"

RSpec.describe AcknowledgesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mysite/acknowledges").to route_to("controller"=>"acknowledges", "action"=>"index", "site"=>"mysite")
    end

    it "routes to #show" do
      pending "not yet implemented"
      expect(:get => "/mysite/acknowledges/1").to route_to("acknowledges#show", :id => "1")
    end

  end
end
