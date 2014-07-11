require 'rails_helper'

RSpec.describe "sites/index", :type => :view do
  before(:each) do
    assign(:sites, [
      Site.create!(
        :name => "Name1",
        :connection_type => "unix://",
        :uri => "Uri"
      ),
      Site.create!(
        :name => "Name2",
        :connection_type => "unix://",
        :uri => "Uri"
      )
    ])
  end

  it "renders a list of sites" do
    render
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => "unix://".to_s, :count => 2
    assert_select "tr>td", :text => "Uri".to_s, :count => 2
  end
end
