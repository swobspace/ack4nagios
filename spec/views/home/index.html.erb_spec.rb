require 'rails_helper'

RSpec.describe "home/index.html.erb", :type => :view do
  it "should render home#index" do
    render
    expect(rendered).to match(/ack4nagios/)
  end
end
