require 'rails_helper'

RSpec.describe "services/index", :type => :view do
  before(:each) do
    @site = FactoryBot.create(:site)
    assign(:services, [
      Service.create!(
        :site => @site,
        :host => "Host",
        :service_description => "Service Description"
      ),
      Service.create!(
        :site => @site,
        :host => "Host",
        :service_description => "Service Description"
      )
    ])
  end

  it "renders a list of services" do
    render
    assert_select "tr>td", :text => @site.name, :count => 2
    assert_select "tr>td", :text => "Host".to_s, :count => 2
    assert_select "tr>td", :text => "Service Description".to_s, :count => 2
  end
end
