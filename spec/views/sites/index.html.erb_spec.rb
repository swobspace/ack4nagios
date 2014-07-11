require 'rails_helper'

RSpec.describe "sites/index", :type => :view do
  before(:each) do
    assign(:sites, [
      Site.create!(
        :name => "Name",
        :connection_type => "Connection Type",
        :uri => "Uri"
      ),
      Site.create!(
        :name => "Name",
        :connection_type => "Connection Type",
        :uri => "Uri"
      )
    ])
  end

  it "renders a list of sites" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Connection Type".to_s, :count => 2
    assert_select "tr>td", :text => "Uri".to_s, :count => 2
  end
end
