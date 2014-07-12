require 'rails_helper'

RSpec.describe "services/show", :type => :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :site => "Site",
      :host => "Host",
      :service_description => "Service Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Site/)
    expect(rendered).to match(/Host/)
    expect(rendered).to match(/Service Description/)
  end
end
