require 'rails_helper'

RSpec.describe Site, :type => :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:connection_type) }
  it { is_expected.to validate_presence_of(:uri) }

  it "should get plain factory working" do
    f = FactoryGirl.create(:site)
    g = FactoryGirl.create(:site)
    expect(f).to be_valid
    expect(g).to be_valid

    is_expected.to validate_uniqueness_of :name
  end
end
