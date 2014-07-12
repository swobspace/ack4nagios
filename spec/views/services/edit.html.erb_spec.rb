require 'rails_helper'

RSpec.describe "services/edit", :type => :view do
  before(:each) do
    @service = assign(:service, Service.create!(
      :site => "MyString",
      :host => "MyString",
      :service_description => "MyString"
    ))
  end

  it "renders the edit service form" do
    render

    assert_select "form[action=?][method=?]", service_path(@service), "post" do

      assert_select "input#service_site[name=?]", "service[site]"

      assert_select "input#service_host[name=?]", "service[host]"

      assert_select "input#service_service_description[name=?]", "service[service_description]"
    end
  end
end
