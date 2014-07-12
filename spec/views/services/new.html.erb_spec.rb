require 'rails_helper'

RSpec.describe "services/new", :type => :view do
  before(:each) do
    assign(:service, Service.new(
      :site => "MyString",
      :host => "MyString",
      :service_description => "MyString"
    ))
  end

  it "renders new service form" do
    render

    assert_select "form[action=?][method=?]", services_path, "post" do

      assert_select "input#service_site[name=?]", "service[site]"

      assert_select "input#service_host[name=?]", "service[host]"

      assert_select "input#service_service_description[name=?]", "service[service_description]"
    end
  end
end
