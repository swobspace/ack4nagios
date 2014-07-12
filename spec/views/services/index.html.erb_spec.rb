require 'rails_helper'

RSpec.describe "services/index", :type => :view do
  before(:each) do
    assign(:services, [
      Service.create!(
        :site => "Site",
        :host => "Host",
        :service_description => "Service Description"
      ),
      Service.create!(
        :site => "Site",
        :host => "Host",
        :service_description => "Service Description"
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => "Site".to_s, :count => 2
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    assert_select "tr>td", :text => "Service Description".to_s, :count => 2
  end
end
