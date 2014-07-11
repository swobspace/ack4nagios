require 'rails_helper'

RSpec.describe "acknowledges/index", :type => :view do
  before(:each) do
    assign(:acknowledges, [
      Acknowledge.create!(
        :index => "Index"
      ),
      Acknowledge.create!(
        :index => "Index"
      )
    ])
  end

  it "renders a list of acknowledges" do
    render
    assert_select "tr>td", :text => "Index".to_s, :count => 2
  end
end
