require 'rails_helper'

RSpec.describe "sites/new", :type => :view do
  before(:each) do
    assign(:site, Site.new(
      :name => "MyString",
      :connection_type => "MyString",
      :uri => "MyString"
    ))
  end

  it "renders new site form" do
    render

    assert_select "form[action=?][method=?]", sites_path, "post" do

      assert_select "input#site_name[name=?]", "site[name]"

      assert_select "input#site_connection_type[name=?]", "site[connection_type]"

      assert_select "input#site_uri[name=?]", "site[uri]"
    end
  end
end
