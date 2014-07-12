require 'rails_helper'

RSpec.describe Service, :type => :model do
  it { is_expected.to belong_to(:site) }
  it { is_expected.to validate_presence_of(:host) }
  it { is_expected.to validate_presence_of(:service_description) }
  it { is_expected.to validate_presence_of(:site_id) }

  it "should get plain factory working" do
    f = FactoryGirl.create(:service)
    g = FactoryGirl.create(:service)
    expect(f).to be_valid
    expect(g).to be_valid
  end
end
