require 'rails_helper'

RSpec.describe "sites/show", :type => :view do
  before(:each) do
    @site = assign(:site, Site.create!(
      :name => "Name",
      :connection_type => "unix://",
      :uri => "Uri"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/unix:\/\//)
    expect(rendered).to match(/Uri/)
  end
end
