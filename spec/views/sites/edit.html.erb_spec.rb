require 'rails_helper'

RSpec.describe "sites/edit", :type => :view do
  before(:each) do
    @ability = Object.new
    @ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability) { @ability }
    allow(controller).to receive(:controller_name) { "sites" }
    allow(controller).to receive(:action_name) { "edit" }

    @site = assign(:site, Site.create!(
      :name => "MyString",
      :connection_type => "unix://",
      :uri => "MyString"
    ))
  end

  it "renders the edit site form" do
    render

    assert_select "form[action=?][method=?]", site_path(@site), "post" do

      assert_select "input#site_name[name=?]", "site[name]"

      assert_select "select#site_connection_type[name=?]", "site[connection_type]"

      assert_select "input#site_uri[name=?]", "site[uri]"
    end
  end
end
